import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/text_style.dart';
import 'package:taskatti/core/widgets/custom_btn.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final box = Hive.box('user');
    var darkMode = box.get('darkMode');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
              onPressed: () {
                box.put('darkMode', !darkMode);
              },
              icon: Icon(darkMode ? Icons.sunny : Icons.dark_mode_rounded))
        ],
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: Hive.box('user').listenable(),
          builder: (context, value, child) {
            String path = box.get('image') ?? '';
            String name = box.get('name') ?? '';
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: path.isNotEmpty
                            ? FileImage(File(path)) as ImageProvider
                            : const AssetImage('Assets/user.png'),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(30))),
                                  backgroundColor: theme.background,
                                  context: context,
                                  builder: (Builder) {
                                    return SizedBox(
                                      height: 200,
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomButton(
                                              width: 350,
                                              title: 'Upload from Camera',
                                              onPressed: () {}),
                                          const Gap(10),

                                          //upload from gallery
                                          CustomButton(
                                              width: 350,
                                              title: 'Upload from Gallery',
                                              onPressed: () {}),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: AppColors.blue,
                              foregroundColor: theme.background,
                              child: const Icon(Icons.camera_alt_rounded),
                            ),
                          ))
                    ],
                  ),
                  const Gap(20),
                  Divider(
                    color: AppColors.blue,
                    endIndent: 20,
                    indent: 20,
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Text(
                        name,
                        style: titleStyle(context, color: AppColors.blue),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit_outlined,
                          color: AppColors.blue,
                        ),
                        style: IconButton.styleFrom(
                            side: BorderSide(color: AppColors.blue)),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
