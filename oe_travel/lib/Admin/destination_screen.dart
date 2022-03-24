import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:oe_travel/Admin/destination_provider.dart';

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
  final destinationImageController = TextEditingController();

  final String destinationImageUrl;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    destinationImageController.text = "";
    final future = Provider.of<DestinationProvider>(context, listen: false)
        .fetchDestinationData(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Destination",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: CurvedBodyWidget(
        widget: SingleChildScrollView(
          child: FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Please provide destination details",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: SizeConfig.height * 2,
                      ),
                      Text(
                        " Name",
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
                        "Description",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(
                        height: SizeConfig.height,
                      ),
                      InputTextField(
                        title: "Destination  Description",
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: destinationDescriptionController,
                        validate: (value) =>
                            ValidationMixin().validate(value!, "destination"),
                        onFieldSubmitted: (_) {},
                      ),
                      SizedBox(
                        height: SizeConfig.height * 5,
                      ),
                      Center(
                        child: FloatingActionButton(
                          hoverColor: Colors.green,
                          focusColor: Colors.orange,
                          backgroundColor: Color.fromARGB(255, 13, 141, 158),
                          onPressed: () async {
                            log("message");
                            destinationImageController.text =
                                await showBottomImageSheet().showBottomSheet(
                                    context,
                                    isDestination: true);
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.height * 2,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () => submit(context),
                          child: const Text("Submit"),
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

        await Provider.of<DestinationProvider>(context, listen: false)
            .addDestinationData(
          context,
          destinationNameController.text,
          destinationDescriptionController.text,
          destinationImageController.text.isEmpty
              ? destinationImageUrl
              : destinationImageController.text,
        );
        // Navigator.pop(context);
        Navigator.pop(context);
      } catch (ex) {
        print(ex.toString());
        Navigator.pop(context);
        GeneralAlertDialog().customAlertDialog(context, ex.toString());
      }
    }
  }
}
