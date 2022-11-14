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
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (_) => EditDestination(),
        //         ),
        //       );
        //     },
        //     icon: const Icon(Icons.edit),
        //   ),
        // ],
      ),
      body: CurvedBodyWidget(
        widget: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Details",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 126, 124, 124),
                  fontFamily: "Roboto",
                ),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            child: imageUrl.isEmpty
                ? Image.network(
                    ImageConstants.imageDestinationUrl,
                    fit: BoxFit.cover,
                  )
                : Image.memory(base64Decode(imageUrl)),
          ),
        ),
        SizedBox(
          height: SizeConfig.height * 3,
        ),
        Text(
          destination.destinationName,
          style: const TextStyle(
              color: Color.fromARGB(255, 153, 153, 152),
              fontSize: 22,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: SizeConfig.height * 2,
        ),
        Text(
          destination.destinationDescription,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color.fromARGB(255, 73, 73, 73),
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
