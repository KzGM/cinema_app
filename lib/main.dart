import 'package:cinema_app/core/common/bloc/app_bloc/app_bloc.dart';
import 'package:cinema_app/core/common/service/dio_client.dart';
import 'package:cinema_app/core/routes/route.dart';
import 'package:cinema_app/core/themes/theme_data.dart';
import 'package:cinema_app/core/utils/dotenv.dart';
import 'package:cinema_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:cinema_app/features/login/presentation/views/login.dart';
import 'package:cinema_app/features/ticket/data/local/ticket_local_datasource.dart';
import 'package:cinema_app/features/ticket/data/local/ticket_local_datasource_sqf.implement.dart';
import 'package:cinema_app/firebase_options.dart';
import 'package:cinema_app/l10n/generated/app_localizations.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

DioClient dioClient = DioClient();
TicketLocalDatasource ticketDatasource = TicketLocalDatasourceSqfImplement();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
  await DotEnvUtils.initDotEnv();
  dioClient.initDio();
  ticketDatasource.initDB();
  configLoading();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: MaterialApp(
          title: 'Flutter Mock App',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.dark,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('vi'),
          onGenerateRoute: RouteGenerator.generate,
          builder: EasyLoading.init(),
          home: BlocProvider(
            create: (context) => LoginBloc(),
            child: LoginScreen(),
          )),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..userInteractions = false
    ..dismissOnTap = false;
}
