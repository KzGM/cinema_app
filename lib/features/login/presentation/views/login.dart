import 'package:cinema_app/core/common/constants/assets.dart';
import 'package:cinema_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    final bloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              Assets.svg.icProductLogo,
              width: 120,
              height: 120,
            ),
          ],
        ),
      )),
    );
  }
}
