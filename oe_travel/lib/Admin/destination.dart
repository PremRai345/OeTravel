import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oe_travel/constant/constants.dart';
import 'package:oe_travel/providers/user_provider.dart';
import 'package:oe_travel/utils/firebase_helper.dart';

import 'package:oe_travel/utils/size_config.dart';
import 'package:oe_travel/widgets/curved_body_widget.dart';
import 'package:oe_travel/widgets/destination_description_field.dart';
import 'package:oe_travel/widgets/destination_text_field.dart';
import 'package:oe_travel/widgets/general_alert_dialog.dart';

import 'package:provider/provider.dart';

import '../utils/validation_mixin.dart';

class AddDestination extends StatelessWidget {
  AddDestination({required this.imageUrl, Key? key}) : super(key: key);

  final placeNameController = TextEditingController();
  final placeDescriptionController = TextEditingController();
  final catagoryController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Destination",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Roboto",
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: CurvedBodyWidget(
        widget: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Hero(
                  tag: "image-hero",
                  child: SizedBox(
                    height: SizeConfig.height * 2,
                  ),
                ),
                DestinationField(
                  title: "Place Name",
                  controller: placeNameController,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validate: (value) =>
                      ValidationMixin().validate(value!, "PlaceName"),
                  onFieldSubmitted: (_) {},
                ),
                SizedBox(
                  height: SizeConfig.height * 6,
                ),
                DestinationField(
                  title: "Catagory",
                  controller: catagoryController,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validate: (value) =>
                      ValidationMixin().validate(value!, "Catagory"),
                  onFieldSubmitted: (_) {},
                ),
                SizedBox(
                  height: SizeConfig.height * 6,
                ),
                DestinationDesField(
                  title: "Description",
                  controller: placeDescriptionController,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  validate: (value) => ValidationMixin().validate(
                    value!,
                    "Description",
                  ),
                  onFieldSubmitted: (_) {
                    submit(context);
                  },
                ),
                SizedBox(
                  height: SizeConfig.height * 6,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 179, 134),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(28),
                      ),
                    ),
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text(
                    "Select Image",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Roboto",
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),

                  onPressed: () {
                    showBottomSheet(context);
                  },
                  //child: const Text("Submit"),
                ),
                SizedBox(
                  height: SizeConfig.height * 6,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 179, 134),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(28),
                      ),
                    ),
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Roboto",
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),

                  onPressed: () => submit(context),
                  //child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  submit(BuildContext conetxt) async {
    if (formKey.currentState!.validate()) {
      try {
        final uid = Provider.of<UserProvider>(conetxt, listen: false).user.uuid;
        final map = {
          "PlaceName": placeNameController.text,
          "Catagory": catagoryController.text,
          "Description": placeDescriptionController.text,
          "uuid": uid,
          "image": imageUrl,
        };

        await FireBaseHelper().addOrUpdateContent(
          conetxt,
          collectionId: DestinationConstants.destinationCollection,
          whereId: UserConstants.userId,
          whereValue: uid,
          map: map,
        );
      } catch (ex) {
        GeneralAlertDialog().customAlertDialog(conetxt, ex.toString());
      }
    }
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
