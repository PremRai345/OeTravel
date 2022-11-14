import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:oe_travel/constant/constants.dart';
import 'package:oe_travel/providers/user_provider.dart';
import 'package:oe_travel/utils/size_config.dart';
import 'package:oe_travel/utils/validation_mixin.dart';
import 'package:oe_travel/widgets/curved_body_widget.dart';
import 'package:oe_travel/widgets/general_alert_dialog.dart';

import 'package:oe_travel/widgets/profile_textfield_box.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({required this.imageUrl, Key? key}) : super(key: key);
  final String imageUrl;
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final ageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // show the user's profile  value in profile screen
    final profileData = Provider.of<UserProvider>(context).user;
    nameController.text = profileData.name ?? "";
    ageController.text =
        profileData.age != null ? profileData.age.toString() : "";
    addressController.text = profileData.address ?? "";
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: CurvedBodyWidget(
        widget: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Hero(
                  tag: 'image-hero',
                  child: SizedBox(
                    height: SizeConfig.height * 16,
                    width: SizeConfig.height * 16,
                    child: Stack(
                      // Stack is used to show the camera icon with profile image.
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(SizeConfig.height * 8),
                          child: profileData.image == null
                              ? Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                )
                              : Image.memory(
                                  base64Decode(profileData.image!),
                                  fit: BoxFit.cover,
                                ),
                        ),

                        //Camera Icon with profile Image
                        Positioned(
                          bottom: 4,
                          left: 75,
                          child: GestureDetector(
                            onTap: () => showBottomSheet(context),
                            child: const CircleAvatar(
                              radius: 16.0,
                              backgroundColor:
                                  Color.fromARGB(255, 197, 195, 195),
                              child: Icon(
                                Icons.camera_alt_sharp,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.height * 2,
                ),
                Text(
                  "Edit your profile",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: SizeConfig.height * 2,
                ),
                ProfileField(
                  title: "Name",
                  controller: nameController,
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validate: (value) =>
                      ValidationMixin().validate(value!, "name"),
                  onFieldSubmitted: (_) {},
                ),
                SizedBox(
                  height: SizeConfig.height * 1.5,
                ),
                ProfileField(
                  title: "Address",
                  controller: addressController,
                  textInputType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  validate: (value) =>
                      ValidationMixin().validate(value!, "address"),
                  onFieldSubmitted: (_) {},
                ),
                SizedBox(
                  height: SizeConfig.height * 1.5,
                ),
                ProfileField(
                  title: "Age",
                  controller: ageController,
                  maxLength: 3,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  validate: (value) => ValidationMixin().validateAge(
                    value!,
                  ),
                  onFieldSubmitted: (_) {},
                ),
                SizedBox(
                  height: SizeConfig.height * 8,
                ),
                const Text("Update",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                        color: Color.fromARGB(255, 121, 119, 119))),
                SizedBox(
                  height: SizeConfig.height * 1,
                ),
                Container(
                  width: SizeConfig.width * 70,
                  height: SizeConfig.height * 8,
                  child: FloatingActionButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          GeneralAlertDialog().customLoadingDialog(context);
                          final map =
                              Provider.of<UserProvider>(context, listen: false)
                                  .updateUser(
                            name: nameController.text,
                            address: addressController.text,
                            age: int.parse(ageController.text),
                          );
                          final fireStore = FirebaseFirestore.instance;
                          final data = await fireStore
                              .collection(UserConstants.userCollection)
                              .where(UserConstants.userId,
                                  isEqualTo: profileData.uuid)
                              .get();
                          if (data.docs.isEmpty) {
                            await fireStore
                                .collection(UserConstants.userCollection)
                                .add(map);
                          } else {
                            data.docs.first.reference.update(map);
                          }
                          Navigator.pop(context);
                          Navigator.pop(context);
                        } catch (ex) {
                          Navigator.pop(context);
                        }
                        // print(map);
                      }
                    },
                    backgroundColor: const Color.fromARGB(248, 5, 190, 144),
                    child: const Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) async {
    final imagePicker = ImagePicker();

    await showModalBottomSheet(
      context: context,
      builder: (_) => Padding(
        padding: basePadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Select Image",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: SizeConfig.height * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildChooseOptions(
                  //Pick Image From Camera
                  context,
                  func: () async {
                    final xFile =
                        await imagePicker.pickImage(source: ImageSource.camera);
                    if (xFile != null) {
                      final unit8list = await xFile.readAsBytes();
                      Provider.of<UserProvider>(context, listen: false)
                          .updateUserImage(base64Encode(unit8list));
                    }
                  },
                  iconData: Icons.camera_outlined,
                  label: "Camera",
                ),
                buildChooseOptions(
                  //Pick Image From Gallery
                  context,
                  func: () async {
                    final xFile = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    if (xFile != null) {
                      final unit8list = await xFile.readAsBytes();
                      Provider.of<UserProvider>(context, listen: false)
                          .updateUserImage(base64Encode(unit8list));
                    }
                  },
                  iconData: Icons.collections_outlined,
                  label: "Gallery",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column buildChooseOptions(
    BuildContext context, {
    required Function func,
    required IconData iconData,
    required String label,
  }) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            print("object");
            func();
          },
          color: Theme.of(context).primaryColor,
          iconSize: SizeConfig.height * 6,
          icon: Icon(iconData),
        ),
        Text(label),
      ],
    );
  }
}
