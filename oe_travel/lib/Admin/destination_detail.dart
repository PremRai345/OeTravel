import 'package:flutter/material.dart';
import 'package:oe_travel/Admin/edit_destination.dart';
import 'package:oe_travel/models/destination_model.dart';

import 'package:oe_travel/utils/size_config.dart';

import '../widgets/curved_body_widget.dart';

class DestinationDetails extends StatelessWidget {
  DestinationDetails({required this.destination, Key? key}) : super(key: key);

  late Destination destination;
  final String imageOfDestination =
      "https://cdn.britannica.com/68/178668-050-DA998E6C/Durbar-Square-heart-district-Kathmandu-earthquake-Nepal-April-25-2015.jpg";

  @override
  Widget build(BuildContext context) {
    print(destination.id);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
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
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: CurvedBodyWidget(
        widget: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Details",
              ),
              SizedBox(
                height: SizeConfig.height,
              ),
              buildDestinationDetails(imageUrl: imageOfDestination),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
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
