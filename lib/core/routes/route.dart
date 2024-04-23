import 'package:cinema_app/features/home/presentation/home_route.dart';
import 'package:cinema_app/features/home/presentation/views/home_screen.dart';
import 'package:cinema_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:cinema_app/features/login/presentation/login_route.dart';
import 'package:cinema_app/features/login/presentation/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case HomeRoute.screenName:
        return MaterialPageRoute(builder: (context) {
          return HomeScreen();
        });
      case LoginRoute.screenName:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => LoginBloc(),
            child: const LoginScreen(),
          );
        });
      default:
    }
    return null;
  }
}
