import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskatti/core/services/local_storage.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/text_style.dart';
import 'package:taskatti/core/widgets/custom_btn.dart';
import 'package:taskatti/features/update_profile/widgets/circle_container.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.sunny))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Circle(
                      raduis: 150,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: (path != null)
                              ? FileImage(File(path!)) as ImageProvider
                              : const AssetImage('Assets/user.png'))),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Circle(
                        raduis: 50,
                        child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(30))),
                                  backgroundColor: AppColors.white,
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
                                              onPressed: () {
                                                uploadImage(true);
                                              }),
                                          const Gap(10),

                                          //upload from gallery
                                          CustomButton(
                                              width: 350,
                                              title: 'Upload from Gallery',
                                              onPressed: () {
                                                uploadImage(false);
                                              }),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              size: 22,
                              color: AppColors.white,
                            )),
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
                    style: titleStyle(color: AppColors.blue),
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
        ),
      ),
    );
  }

  uploadImage(bool isCamera) async {
    final pickedImage = await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
