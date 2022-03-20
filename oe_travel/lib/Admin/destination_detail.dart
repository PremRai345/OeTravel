import 'package:flutter/material.dart';
import 'package:oe_travel/Admin/edit_destination.dart';
import 'package:oe_travel/models/destination_model.dart';

import 'package:oe_travel/utils/size_config.dart';

import '../widgets/curved_body_widget.dart';

class DestinationDetails extends StatelessWidget {
  const DestinationDetails({required this.destination, Key? key})
      : super(key: key);

  final Destination destination;
  final String imageOfDestination =
      "https://www.nepal-travel-guide.com/wp-content/uploads/2020/05/image-156.png";

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.height * 1.5,
        ),
        Text(destination.destinationName),
        Text(destination.destinationDescription),
      ],
    );
  }
}
