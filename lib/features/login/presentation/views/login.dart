import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cinema_app/core/common/constants/assets.dart';
import 'package:cinema_app/core/common/widget/customize_button.dart';
import 'package:cinema_app/core/utils/localizations.dart';
import 'package:cinema_app/features/home/presentation/home_route.dart';
import 'package:cinema_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:cinema_app/features/login/presentation/bloc/login_event.dart';
import 'package:cinema_app/features/login/presentation/bloc/login_state.dart';
import 'package:cinema_app/features/login/presentation/views/widgets/login_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ThemeData theme;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late LoginBloc bloc;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    bloc = BlocProvider.of<LoginBloc>(context);
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginLoadingState) {
        EasyLoading.show();
      } else if (state is LoginSuccesssfulState) {
        EasyLoading.dismiss();
        showOkAlertDialog(context: context, message: state.message);
        Navigator.pushReplacementNamed(context, HomeRoute.screenName);
      } else if (state is LoginFailedState) {
        EasyLoading.dismiss();
        showOkAlertDialog(context: context, message: state.errorMessage);
      } else if (state is LoginThirdPartyFailedState) {
        EasyLoading.dismiss();
        showOkAlertDialog(context: context, message: state.errorMessage);
      }
    }, builder: (context, state) {
      final isUsernameError =
          state is LoginFailedState ? state.usernameFailed : false;
      final isPasswordError =
          state is LoginFailedState ? state.passwordFailed : false;
      final errorMessage =
          state is LoginFailedState ? state.errorMessage : null;
      return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40,
                ),
                SvgPicture.asset(
                  Assets.svg.icAppIcon,
                  width: 120,
                  height: 120,
                ),
                SizedBox(
                  height: 40,
                ),
                _buildLogin(context,
                    usernameError:
                        isUsernameError == true ? errorMessage : null,
                    passwordError:
                        isPasswordError == true ? errorMessage : null),
                SizedBox(
                  height: 40,
                ),
                _buildSignInWith(context),
              ],
            ),
          ),
        )),
      );
    });
  }

  Padding _buildLogin(
    BuildContext context, {
    String? usernameError,
    String? passwordError,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 36),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginTextField(
            controller: usernameController,
            title: translate(context).username,
            isPassword: false,
            errorMessage: usernameError,
          ),
          const SizedBox(
            height: 24,
          ),
          LoginTextField(
            controller: passwordController,
            title: translate(context).password,
            isPassword: true,
            errorMessage: passwordError,
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                translate(context).forgotPassword,
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: theme.colorScheme.primary),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          CustomizedButton(
            backgroundColor: theme.colorScheme.primary,
            textColor: theme.colorScheme.onPrimary,
            onTap: () {
              final event = UsernameLoginEvent(
                  username: usernameController.text,
                  password: passwordController.text);
              final loginBloc = BlocProvider.of<LoginBloc>(context);
              loginBloc.add(event);
            },
            child: Text(
              translate(context).login,
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Column _buildSignInWith(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(translate(context).orSigninWith),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSignin(isGoogle: true),
            _buildSignin(isGoogle: false),
          ],
        ),
      ],
    );
  }

  Widget _buildSignin({required bool isGoogle}) {
    return SizedBox(
      width: 81,
      height: 81,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              bloc.add(ThirdPartyLoginEvent(isGoogle: isGoogle));
            },
            child: Image.asset(
              isGoogle ? Assets.images.icGGSignIn : Assets.images.icFBSignIn,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            isGoogle ? 'Google' : 'Facebook',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
