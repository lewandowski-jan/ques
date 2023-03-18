import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ques/app.dart';
import 'package:ques/features/auth/auth_cubit.dart';
import 'package:ques/features/bluetooth/bluetooth_cubit.dart';
import 'package:ques/features/location/location_cubit.dart';
import 'package:ques/features/router/router.dart';
import 'package:ques/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  await Firebase.initializeApp(
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
        BlocProvider(
          lazy: false,
          create: (_) => BluetoothCubit(),
        ),
        Provider(
          create: (context) => QSRouter(
            refreshStreams: [
              context.read<AuthCubit>().stream,
            ],
          ),
        ),
      ],
      child: const QSApp(),
    ),
  );
}
