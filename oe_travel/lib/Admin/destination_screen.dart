import 'package:flutter/material.dart';

import 'package:oe_travel/Admin/destination_provider.dart';

import 'package:oe_travel/models/destination_model.dart';

import 'package:oe_travel/utils/size_config.dart';
import 'package:oe_travel/widgets/button_sheet.dart';
import 'package:oe_travel/widgets/curved_body_widget.dart';

import 'package:oe_travel/widgets/general_alert_dialog.dart';
import 'package:oe_travel/widgets/text_form_field.dart';

import 'package:provider/provider.dart';

import '../utils/validation_mixin.dart';

class AddDestination extends StatelessWidget {
  AddDestination({required this.destinationImageUrl, Key? key})
      : super(key: key);

  final destinationNameController = TextEditingController();
  final destinationDescriptionController = TextEditingController();

  final String destinationImageUrl;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final future = Provider.of<DestinationProvider>(context, listen: false)
        .fetchDestinationData(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Destination"),
      ),
      body: CurvedBodyWidget(
        widget: SingleChildScrollView(
          child: FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add Destination Information",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: SizeConfig.height * 2,
                      ),
                      Text(
                        "Destination Name",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(
                        height: SizeConfig.height,
                      ),
                      InputTextField(
                        title: "Destination Name",
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: destinationNameController,
                        validate: (value) => ValidationMixin()
                            .validate(value!, "destination name"),
                        onFieldSubmitted: (_) {},
                      ),
                      SizedBox(
                        height: SizeConfig.height * 2,
                      ),
                      Text(
                        "Destination ",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(
                        height: SizeConfig.height,
                      ),
                      InputTextField(
                        title: "Destination ",
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: destinationDescriptionController,
                        validate: (value) =>
                            ValidationMixin().validate(value!, "destination"),
                        onFieldSubmitted: (_) {},
                      ),
                      SizedBox(
                        height: SizeConfig.height * 2,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showBottomImageSheet().showBottomSheet(context);
                        },
                        child: Text("Upload Image"),
                      ),
                      SizedBox(
                        height: SizeConfig.height * 2,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () => submit(context),
                          child: Text("Submit"),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  submit(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        GeneralAlertDialog().customLoadingDialog(context);

        final map = Destination(
          destinationName: destinationNameController.text,
          destinationDescription: destinationDescriptionController.text,
        ).toJson();

        Navigator.pop(context);
        Navigator.pop(context);

        await Provider.of<DestinationProvider>(context, listen: false)
            .addHotelData(
          context,
          destinationNameController.text,
          destinationDescriptionController.text,
        );
      } catch (ex) {
        print(ex.toString());
      }
    }
  }
}
