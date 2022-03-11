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

class ProfileScreen extends StatelessWidget {
  ProfileScreen({required this.imageUrl, Key? key}) : super(key: key);
  final String imageUrl;
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final ageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    radius: SizeConfig.height * 7,
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
                const Text("Verify",
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
                        GeneralAlertDialog().customLoadingDialog(context);
                        final map =
                            Provider.of<UserProvider>(context, listen: false)
                                .updateUser(
                          name: nameController.text,
                          address: addressController.text,
                          age: int.parse(ageController.text),
                        );
                        final fireStore = FirebaseFirestore.instance;
                        await fireStore
                            .collection(UserConstants.userCollection)
                            .add(map);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    },
                    backgroundColor: const Color.fromARGB(248, 5, 190, 144),
                    child: const Icon(Icons.thumb_up),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
