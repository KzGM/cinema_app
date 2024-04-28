import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cinema_app/core/common/bloc/app_bloc/app_bloc.dart';
import 'package:cinema_app/core/common/bloc/app_bloc/app_event.dart';
import 'package:cinema_app/core/common/constants/assets.dart';
import 'package:cinema_app/core/common/model/bloc_status_state.dart';
import 'package:cinema_app/core/utils/localizations.dart';
import 'package:cinema_app/features/account/domain/entities/account_entity.dart';
import 'package:cinema_app/features/account/presentation/bloc/account_bloc.dart';
import 'package:cinema_app/features/account/presentation/bloc/account_event.dart';
import 'package:cinema_app/features/account/presentation/bloc/account_state.dart';
import 'package:cinema_app/features/account/presentation/views/widgets/account_avatar_name_widget.dart';
import 'package:cinema_app/features/account/presentation/views/widgets/account_information_widget.dart';
import 'package:cinema_app/features/login/presentation/login_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cinema_app/core/common/widget/customize_button.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late ThemeData _themeData;
  TextTheme get _textTheme => _themeData.textTheme;
  ColorScheme get _colorScheme => _themeData.colorScheme;

  OutlineInputBorder get normalBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 1,
          color: _colorScheme.primaryContainer,
        ),
      );

  AccountBloc get bloc => BlocProvider.of<AccountBloc>(context);

  @override
  void initState() {
    super.initState();
    // UserId
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      bloc.add(GetAccountInfoEvent(userId: userId));
    }
  }

  AccountEntity? _account;
  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return BlocConsumer<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state.status == BlocStatusState.loading) {
          EasyLoading.show();
        } else {
          EasyLoading.dismiss();
        }

        if (state.status == BlocStatusState.success) {
          if (state.successMessage != null) {
            showOkAlertDialog(
              context: context,
              title: translate(context).inform,
              message: state.successMessage,
            );
            // toast
          }
        } else if (state.status == BlocStatusState.failed) {
          if (state.errorMessage != null) {
            showOkAlertDialog(
              context: context,
              title: translate(context).error,
              message: state.errorMessage,
            );
            // toast
          }
        }
      },
      builder: (context, state) {
        _account = state.account;
        return Scaffold(
          appBar: _buildAppbar(context),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    AccountAvatarNameWidget(
                      name: _account?.fullName, // 'Jack Sparrow'
                      avatarUrl: _account?.avatarUrl,
                      onChangeAvatar: (avatarData) {
                        // Firebase storage => Change avatar
                        if (_account != null) {
                          bloc.add(
                            SetAccountAvatarInfoEvent(
                              entity: _account!,
                              avatarData: avatarData,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    AccountInformationWidget(
                      currentAccount: _account,
                      onSaveChanged: (account) {
                        print(account.toString());
                        bloc.add(SetAccountInfoEvent(entity: account));
                      },
                    ),
                    CustomizedButton(
                      onTap: () {
                        final appBloc = BlocProvider.of<AppBloc>(context);
                        appBloc.add(
                          ChangeLanguageAppEvent(locale: const Locale('vi')),
                        );
                      },
                      text: 'Change language to Vi',
                    ),
                    CustomizedButton(
                      onTap: () {
                        final appBloc = BlocProvider.of<AppBloc>(context);
                        appBloc.add(
                          ChangeLanguageAppEvent(locale: const Locale('en')),
                        );
                      },
                      text: 'Change language to En',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.chevron_left,
          color: _colorScheme.primaryContainer,
          size: 32,
        ),
      ),
      title: Text(
        translate(context).profile,
        style: _textTheme.titleMedium,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut(); // Function in UI XXXXXXX (do not)
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginRoute.RouteName,
              (route) => false,
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              Assets.svg.icLogout,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }
}
