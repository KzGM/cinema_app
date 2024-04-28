import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/common/constants/app_constants.dart';
import '../../../../../core/common/constants/assets.dart';
import '../../../../../core/common/enums/gender.dart';
import '../../../../../core/common/widget/customize_button.dart';
import '../../../../../core/utils/localizations.dart';
import '../../../domain/entities/account_entity.dart';
import '../../../../../core/utils/date_utils.dart';

class AccountInformationWidget extends StatefulWidget {
  AccountEntity? currentAccount;
  Function(AccountEntity) onSaveChanged;
  AccountInformationWidget({
    Key? key,
    this.currentAccount,
    required this.onSaveChanged,
  }) : super(key: key);

  @override
  State<AccountInformationWidget> createState() =>
      _AccountInformationWidgetState();
}

class _AccountInformationWidgetState extends State<AccountInformationWidget> {
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

  // Text Controller
  final fullNameTextController = TextEditingController();
  final phoneNumberTextController = TextEditingController();
  final emailTextController = TextEditingController();

  // Data
  AccountEntity? accountState; // setState

  // Bloc rồi, thì có dùng setState đc nữa ko?
  // Phối hợp
  // setState => nội bộ Widget

  @override
  void initState() {
    super.initState();
    print('Init state');
    accountState = widget.currentAccount;
    // fullNameTextController.text = widget.currentAccount?.fullName ?? '';
    // phoneNumberTextController.text = widget.currentAccount?.phoneNumber ?? '';
    // emailTextController.text = widget.currentAccount?.email ?? '';
  }

  @override
  void didUpdateWidget(covariant AccountInformationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('Did update widget');
    // Init if absent
    if (widget.currentAccount == null) {
      final userFirebase = FirebaseAuth.instance.currentUser;
      accountState = AccountEntity(
        id: FirebaseAuth.instance.currentUser?.uid,
        dateOfBirth: DateTime(2000),
        fullName: FirebaseAuth.instance.currentUser?.displayName, // init
        email:
            FirebaseAuth.instance.currentUser?.email, //Google, Facebook email.
        phoneNumber: FirebaseAuth.instance.currentUser?.phoneNumber,
        avatarUrl: FirebaseAuth.instance.currentUser?.photoURL,
        gender: Gender.male,
        city: cities[0], //TPHCM
      );
    } else {
      accountState = widget.currentAccount;
    }
    fullNameTextController.text = accountState?.fullName ?? '';
    phoneNumberTextController.text = accountState?.phoneNumber ?? '';
    emailTextController.text = accountState?.email ?? '';
  }

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate(context).information,
          style: _textTheme.titleMedium
              ?.copyWith(color: _colorScheme.primaryContainer),
        ),
        _buildFullName(),
        _buildDateOfBirth(),
        _buildPhoneNumber(),
        _buildEmail(),
        _buildGender(),
        _buildCity(),
        _buildSaveButton(),
      ],
    );
  }

  Widget _buildFullName() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            translate(context).fullName,
            style: _textTheme.titleSmall,
          ),
          Container(
            constraints: const BoxConstraints(
              minHeight: 40,
              maxHeight: 40,
              minWidth: 175,
              maxWidth: 175,
            ),
            child: TextField(
              controller: fullNameTextController,
              style: _textTheme.bodyMedium,
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                contentPadding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 9,
                  bottom: 11,
                ),
                enabledBorder: normalBorder,
                border: normalBorder,
                fillColor: Colors.grey,
              ),
              onChanged: (value) {
                setState(() {
                  accountState = accountState?.copyWith(fullName: value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateOfBirth() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              translate(context).dateOfBirth,
              style: _textTheme.titleSmall,
            ),
          ),
          GestureDetector(
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(1950),
                lastDate: DateTime(2010),
                initialDate:
                    widget.currentAccount?.dateOfBirth ?? DateTime(2009),
              );
              if (pickedDate != null) {
                setState(() {
                  accountState =
                      accountState?.copyWith(dateOfBirth: pickedDate);
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: _colorScheme.primaryContainer,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    accountState?.dateOfBirth?.toLocalddmmyyyy() ?? '',
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SvgPicture.asset(
                    Assets.svg.icCalander,
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            translate(context).phoneNumber,
            style: _textTheme.titleSmall,
          ),
          Container(
            constraints: const BoxConstraints(
              minHeight: 40,
              maxHeight: 40,
              minWidth: 175,
              maxWidth: 175,
            ),
            child: TextField(
              controller: phoneNumberTextController,
              style: _textTheme.bodyMedium,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                isCollapsed: true,
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 12, top: 10, bottom: 10),
                      child: SvgPicture.asset(
                        Assets.svg.icVnFlag,
                        width: 21,
                        height: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '+84',
                      style: _textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                  ],
                ),
                contentPadding: const EdgeInsets.only(bottom: 2),
                enabledBorder: normalBorder,
                border: normalBorder,
              ),
              onChanged: (value) {
                setState(() {
                  accountState = accountState?.copyWith(phoneNumber: value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmail() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              translate(context).email,
              style: _textTheme.titleSmall,
            ),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              controller: emailTextController,
              style: _textTheme.bodyMedium,
              enabled: false,
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                contentPadding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 9,
                  bottom: 11,
                ),
                enabledBorder: normalBorder,
                border: normalBorder,
                fillColor: Colors.grey,
              ),
              onChanged: (value) {
                setState(() {
                  accountState = accountState?.copyWith(email: value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGender() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            translate(context).gender,
            style: _textTheme.titleSmall,
          ),
          Row(
            children: [
              _buildRadioItem(
                isSelected: accountState?.gender == Gender.male,
                value: Gender.male,
                onChanged: (value) {
                  setState(() {
                    accountState = accountState?.copyWith(gender: value);
                  });
                },
              ),
              const SizedBox(
                width: 4,
              ),
              _buildRadioItem(
                isSelected: accountState?.gender == Gender.female,
                value: Gender.female,
                onChanged: (value) {
                  setState(() {
                    accountState = accountState?.copyWith(gender: value);
                  });
                },
              ),
              const SizedBox(
                width: 4,
              ),
              _buildRadioItem(
                isSelected: accountState?.gender == Gender.other,
                value: Gender.other,
                onChanged: (value) {
                  setState(() {
                    accountState = accountState?.copyWith(gender: value);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRadioItem({
    required bool isSelected,
    required Gender value,
    required Function(Gender) onChanged,
  }) {
    final color =
        isSelected ? _colorScheme.onPrimary : _colorScheme.primaryContainer;
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: isSelected ? 2 : 1,
            color: color,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              isSelected
                  ? Assets.svg.icRadioChecked
                  : Assets.svg.icRadioUnchecked,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              value.getTitle(context),
              style: _textTheme.bodyMedium?.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCity() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            translate(context).city,
            style: _textTheme.titleSmall,
          ),
          Container(
            height: 40,
            padding:
                const EdgeInsets.only(left: 16, top: 7, bottom: 9, right: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: _colorScheme.primaryContainer,
              ),
            ),
            child: DropdownButton<String>(
              padding: const EdgeInsets.all(0),
              isDense: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              underline: const SizedBox(),
              items: cities
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: _textTheme.bodyMedium,
                      ),
                    ),
                  )
                  .toList(),
              value: accountState?.city,
              onChanged: (value) {
                setState(() {
                  accountState = accountState?.copyWith(city: value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    final isChanged = accountState != widget.currentAccount;
    return isChanged
        ? Container(
            padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
            alignment: Alignment.center,
            child: SizedBox(
              width: 90,
              child: CustomizedButton(
                height: 30,
                onTap: () {
                  widget.onSaveChanged(accountState!);
                },
                text: translate(context).save,
                backgroundColor: _colorScheme.primary,
              ),
            ),
          )
        : const SizedBox();
  }
}
