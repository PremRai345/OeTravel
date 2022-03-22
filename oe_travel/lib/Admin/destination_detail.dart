import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oe_travel/Admin/edit_destination.dart';
import 'package:oe_travel/constant/constants.dart';
import 'package:oe_travel/models/destination_model.dart';

import 'package:oe_travel/utils/size_config.dart';

import '../widgets/curved_body_widget.dart';

class DestinationDetails extends StatelessWidget {
  DestinationDetails({required this.destination, Key? key}) : super(key: key);

  late Destination destination;

  @override
  Widget build(BuildContext context) {
    print(destination.id);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          destination.destinationName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditDestination(),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: CurvedBodyWidget(
        widget: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Details",
              ),
              SizedBox(
                height: SizeConfig.height,
              ),
              buildDestinationDetails(
                  imageUrl: destination.destinationImageUrl),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDestinationDetails({
    required String imageUrl,
  }) {
    return Column(
      
      children: [
        ClipRect(
          child: imageUrl.isEmpty
              ? Image.network(
                  ImageConstants.imageDestinationUrl,
                  fit: BoxFit.cover,
                )
              : Image.memory(base64Decode(imageUrl)),
        ),
        SizedBox(
          height: SizeConfig.height * 3,
        ),
        Text(destination.destinationName),
        SizedBox(
          height: SizeConfig.height * 5,
        ),
        Text(destination.destinationDescription),
      ],
    );
  }
}
