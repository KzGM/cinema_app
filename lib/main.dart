import 'package:cinema_app/core/common/service/dio_client.dart';
import 'package:cinema_app/core/routes/route.dart';
import 'package:cinema_app/core/themes/theme_data.dart';
import 'package:cinema_app/features/home/presentation/views/home_screen.dart';
import 'package:cinema_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:cinema_app/features/login/presentation/views/login.dart';
import 'package:cinema_app/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

DioClient dioClient = DioClient();
void main() {
  runApp(const MyApp());

  dioClient.initDio();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Mock App',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('vi'),
        onGenerateRoute: RouteGenerator.generate,
        home: BlocProvider(
          create: (context) => LoginBloc(),
          child: LoginScreen(),
        ));
  }
}
