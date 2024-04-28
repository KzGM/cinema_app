import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:image_picker/image_picker.dart';

class AccountAvatarNameWidget extends StatefulWidget {
  final String? avatarUrl;
  final String? name;
  final Function(Uint8List) onChangeAvatar;
  const AccountAvatarNameWidget({
    super.key,
    this.avatarUrl,
    this.name,
    required this.onChangeAvatar,
  });

  @override
  State<AccountAvatarNameWidget> createState() =>
      _AccountAvatarNameWidgetState();
}

class _AccountAvatarNameWidgetState extends State<AccountAvatarNameWidget> {
  late ThemeData _themeData;
  TextTheme get _textTheme => _themeData.textTheme;
  ColorScheme get _colorScheme => _themeData.colorScheme;
  final ImagePicker _picker = ImagePicker();
  Uint8List? imageData;
  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            final image = await _picker.pickImage(source: ImageSource.gallery);
            final imageUint8List = await image?.readAsBytes();

            if (imageUint8List != null) {
              final imageUint8ListCompressed =
                  await FlutterImageCompress.compressWithList(
                imageUint8List,
                quality: 30,
                minHeight: 256,
                minWidth: 256,
              );
              widget.onChangeAvatar(imageUint8ListCompressed);
              setState(() {
                imageData = imageUint8ListCompressed;
              });
            }
          },
          child: Builder(
            builder: (context) {
              if (imageData != null) {
                return CircleAvatar(
                  radius: 40,
                  backgroundImage: MemoryImage(imageData!),
                );
              } else if (widget.avatarUrl?.isNotEmpty == true) {
                return CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(widget.avatarUrl!),
                );
              } else {
                return const Icon(
                  Icons.person,
                  size: 40,
                );
              }
            },
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          widget.name ?? '',
          style: _textTheme.titleLarge,
        ),
      ],
    );
  }
}
