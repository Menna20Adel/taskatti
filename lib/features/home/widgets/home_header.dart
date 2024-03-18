import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskatti/core/functions/routing.dart';
import 'package:taskatti/core/services/local_storage.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/text_style.dart';
import 'package:taskatti/features/update_profile/view/update_profile_view.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String? path;
  String name = '';

  @override
  void initState() {
    super.initState();
    name = AppLocalStorage.getCachedData('name');
    path = AppLocalStorage.getCachedData('image');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $name',
              style: titleStyle(color: AppColors.blue),
            ),
            Text(
              'Have A Nice Day.',
              style: bodyStyle(),
            )
          ],
        ),
        InkWell(
          onTap: () {
            setState(() {
              navigateTo(context, const UpdateProfile());
            });
          },
          child: CircleAvatar(
            radius: 28,
            backgroundImage: (path != null)
                ? FileImage(File(path!)) as ImageProvider
                : const AssetImage('Assets/user.png'),
          ),
        ),
      ],
    );
  }
}
