import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskatti/core/functions/custom_dialogs.dart';
import 'package:taskatti/core/functions/routing.dart';
import 'package:taskatti/core/services/local_storage.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/text_style.dart';
import 'package:taskatti/core/widgets/custom_btn.dart';
import 'package:taskatti/features/home/view/home_view.dart';

String? path;
String name = '';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.blue,
        actions: [
          //done btn
          TextButton(
              onPressed: () {
                if (name.isEmpty) {
                  showErrorDialog(context, 'Please Enter Your Name');
                } else {
                  AppLocalStorage.cacheDate('name', name);
                  AppLocalStorage.cacheDate('image', path);
                  AppLocalStorage.cacheDate('isUpload', true);
                  navigateTo(context, const HomeView());
                }
              },
              child: Text('Done', style: titleStyle(color: AppColors.blue)))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //avatar
              CircleAvatar(
                radius: 70,
                backgroundImage: (path != null)
                    ? FileImage(File(path!)) as ImageProvider
                    : const AssetImage('Assets/user.png'),
              ),
              const Gap(10),

              //upload from camera
              CustomButton(
                  width: 250,
                  title: 'Upload from Camera',
                  onPressed: () {
                    uploadImage(true);
                  }),
              const Gap(10),

              //upload from gallery
              CustomButton(
                  width: 250,
                  title: 'Upload from Gallery',
                  onPressed: () {
                    uploadImage(false);
                  }),

              //divider
              const Gap(10),
              const Divider(
                indent: 20,
                endIndent: 20,
              ),
              const Gap(10),

              //enter your name
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: const InputDecoration(hintText: 'Enter Your Name'),
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
