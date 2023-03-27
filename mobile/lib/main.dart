import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:ques/app.dart';
import 'package:ques/features/auth/auth_cubit.dart';
import 'package:ques/features/battery_strategy/battery_strategy_cubit.dart';
import 'package:ques/features/bluetooth/bluetooth_cubit.dart';
import 'package:ques/features/data/data_repository.dart';
import 'package:ques/features/data/realtime_database.dart';
import 'package:ques/features/devices/devices_cubit.dart';
import 'package:ques/features/location/location_cubit.dart';
import 'package:ques/features/notifications_strategy/notifications_strategy_cubit.dart';
import 'package:ques/features/router/router.dart';
import 'package:ques/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await createHydratedStorage();
  HydratedBloc.storage = storage;

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
    ),
  );

  final firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(
    MultiProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (_) => AuthCubit(),
        ),
        BlocProvider(
          lazy: false,
          create: (_) => LocationCubit(),
        ),
        Provider(
          lazy: false,
          create: (context) => QSRouter(
            refreshStreams: [
              context.read<AuthCubit>().stream,
            ],
          ),
        ),
        Provider(
          lazy: false,
          create: (_) => DataRepository(
            database: RealtimeDatabase(
              firebaseApp: firebaseApp,
            ),
          ),
          dispose: (_, dataRepository) => dataRepository.dispose(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => DevicesCubit(
            dataRepository: context.read(),
          ),
        ),
        BlocProvider(
          lazy: false,
          create: (_) => BatteryStrategyCubit(),
        ),
        BlocProvider(
          lazy: false,
          create: (_) => NotificationsStrategyCubit(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => BluetoothCubit(),
        ),
      ],
      child: const QSApp(),
    ),
  );
}

Future<Storage> createHydratedStorage() async {
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  return storage;
}
