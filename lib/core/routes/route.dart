import 'package:cinema_app/features/account/presentation/account_route.dart';
import 'package:cinema_app/features/account/presentation/bloc/account_bloc.dart';
import 'package:cinema_app/features/account/presentation/views/account_screen.dart';
import 'package:cinema_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:cinema_app/features/home/presentation/home_route.dart';
import 'package:cinema_app/features/home/presentation/views/home_screen.dart';
import 'package:cinema_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:cinema_app/features/login/presentation/login_route.dart';
import 'package:cinema_app/features/login/presentation/views/login.dart';
import 'package:cinema_app/features/movie_detail/presentation/movie_detail_route.dart';
import 'package:cinema_app/features/movie_detail/presentation/view/movie_detail_screen.dart';
import 'package:cinema_app/features/ticket/domain/entities/ticket_entity.dart';
import 'package:cinema_app/features/ticket/presentation/bloc/ticket_bloc.dart';
import 'package:cinema_app/features/ticket/presentation/ticket_route.dart';
import 'package:cinema_app/features/ticket/presentation/view/ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/movie_detail/presentation/bloc/movie_detail_bloc.dart';

class RouteGenerator {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case HomeRoute.screenName:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => HomeBloc(),
            child: HomeScreen(),
          );
        });

      case LoginRoute.RouteName:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => LoginBloc(),
            child: const LoginScreen(),
          );
        });
      case MovieDetailRoute.routeName:
        final args = settings.arguments as List<dynamic>;
        final id = args.first as int?;
        if (id == null) {
          return null;
        }
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => MovieDetailBloc(),
            child: MovieDetailScreen(
              movieId: id.toString(),
            ),
          );
        });
      case TicketRoute.routeName:
        final ticketEntity = settings.arguments as TicketEntity;
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => TicketBloc(),
              child: TicketScreen(ticket: ticketEntity),
            );
          },
        );
      case AccountRoute.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => AccountBloc(),
              child: const AccountScreen(),
            );
          },
        );
      default:
    }
    return null;
  }
}
