import 'package:flutter/material.dart';
import 'package:oe_travel/utils/size_config.dart';
import 'package:oe_travel/utils/validation_mixin.dart';
import 'package:oe_travel/widgets/curved_body_widget.dart';

import 'package:oe_travel/widgets/profile_textfield_box.dart';

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
        title: Text('Profile'),
        backgroundColor: Color.fromRGBO(0, 179, 134, 1),
        elevation: 0,
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
                  height: SizeConfig.height * 2,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  child: Text(
                    "Update",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
