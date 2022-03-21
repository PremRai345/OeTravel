import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oe_travel/constant/constants.dart';
import 'package:oe_travel/providers/user_provider.dart';
import 'package:oe_travel/utils/size_config.dart';
import 'package:provider/provider.dart';

class showBottomImageSheet {
  Future<void>
   showBottomSheet(BuildContext context) async {
    final imagePicker = ImagePicker();

    await showModalBottomSheet(
        context: context,
        builder: (_) => Padding(
              padding: basePadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Choose a source",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: SizeConfig.height * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildPhotoChooseOption(
                        context,
                        function: () async {
                          final xFile = await imagePicker.pickImage(
                              source: ImageSource.camera);
                          if (xFile != null) {
                            final uint8List = await xFile.readAsBytes();
                            final map = Provider.of<UserProvider>(context,
                                    listen: false)
                                .updateUserImage(base64Encode(uint8List));
                          }
                        },
                        iconData: Icons.camera_alt,
                        label: "Camera",
                      ),
                      buildPhotoChooseOption(
                        context,
                        function: () async {
                          final xFile = await imagePicker.pickImage(
                              source: ImageSource.gallery);
                          if (xFile != null) {
                            final uint8List = await xFile.readAsBytes();
                            Provider.of<UserProvider>(context, listen: false)
                                .updateUserImage(base64Encode(uint8List));
                          }
                        },
                        iconData: Icons.collections_outlined,
                        label: "Gallery",
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }

  Column buildPhotoChooseOption(
    BuildContext context, {
    required Function function,
    required IconData iconData,
    required String label,
  }) {
    return Column(
      children: [
        IconButton(
          onPressed: () => function(),
          color: Colors.grey,
          icon: Icon(iconData),
          iconSize: SizeConfig.height * 5,
        ),
        Text(
          label,
        ),
      ],
    );
  }
}
