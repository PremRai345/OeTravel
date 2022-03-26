import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oe_travel/Admin/destination_detail.dart';
import 'package:oe_travel/Admin/destination_provider.dart';
import 'package:oe_travel/Admin/destination_screen.dart';

import 'package:oe_travel/GoogleMap/google_map.dart';
import 'package:oe_travel/Login-Register/profile_screen.dart';
import 'package:oe_travel/providers/user_provider.dart';

import 'package:oe_travel/utils/navigate.dart';
import 'package:provider/provider.dart';
import 'package:oe_travel/constant/constants.dart';

import '../utils/size_config.dart';
import '../widgets/curved_body_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final image =
      "https://cdn.britannica.com/68/178668-050-DA998E6C/Durbar-Square-heart-district-Kathmandu-earthquake-Nepal-April-25-2015.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Oe Travel"),
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      drawer: Drawer(
        child: Column(
          children: [
            Consumer<UserProvider>(builder: (_, data, __) {
              // data.
              return UserAccountsDrawerHeader(
                accountName: Text(data.user.name ?? "No Name"),
                accountEmail: Text(
                  data.user.email ?? "No Email",
                ),
                currentAccountPicture: Hero(
                  tag: "image-url",
                  child: SizedBox(
                    height: SizeConfig.height * 16,
                    width: SizeConfig.height * 16,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProfileScreen(
                              imageUrl: '',
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.height * 8),
                        child: data.user.image == null
                            ? Image.network(
                                image,
                                fit: BoxFit.cover,
                              )
                            : Image.memory(
                                base64Decode(data.user.image!),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                ),
              );
            }),
            //Called Dynamic build List and given value to it
            buildListTile(
              context,
              label: "Profile",
              widget: ProfileScreen(
                imageUrl: image,
              ),
              icon: Icons.person,
            ),

            // buildListTile(
            //   context,
            //   label: "Settings",
            //   widget: const Settings(),
            //   icon: Icons.settings,
            // ),

            Provider.of<UserProvider>(context).user.isAdmin
                ? buildListTile(context,
                    label: "Add Destination",
                    widget: AddDestination(
                        destinationImageUrl:
                            ImageConstants.imageDestinationUrl),
                    icon: Icons.travel_explore_outlined)
                : Container(),

            buildListTile(
              context,
              label: "Map",
              widget: const MapMultiMarker(),
              icon: Icons.map_outlined,
            ),

            SizedBox(
              height: SizeConfig.height * 8,
            ),
            //For Follow Us
            const ListTile(
              title: Text(
                "Follow Us",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.height * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 35,
                  height: 35,
                  child: const Image(
                    image: AssetImage("assets/images/facebook.png"),
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                  child: const Image(
                    image: AssetImage("assets/images/twitter.png"),
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                  child: const Image(
                    image: AssetImage("assets/images/instagram.png"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: CurvedBodyWidget(
        widget: FutureBuilder(
            future: Provider.of<DestinationProvider>(context, listen: true)
                .fetchDestinationData(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final listOfDestination =
                  Provider.of<DestinationProvider>(context).listOfDestination;

              return listOfDestination.isEmpty
                  ? const Center(
                      child: Text("There is no any Places"),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.width * 3,
                            ),
                            child: const Text(
                              "Discover",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 38,
                                fontFamily: "SanFrancisco",
                                color: Color.fromARGB(250, 118, 119, 119),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.height * 1.5,
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listOfDestination.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => navigate(
                                  context,
                                  DestinationDetails(
                                    destination: listOfDestination[index],
                                  ),
                                ),
                                child: destinationCard(
                                  context,
                                  destinationName:
                                      listOfDestination[index].destinationName,
                                  destinationDescription:
                                      listOfDestination[index]
                                          .destinationDescription,
                                  imageUrl: listOfDestination[index]
                                      .destinationImageUrl,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: SizeConfig.height * 2,
                              );
                            },
                            primary: false,
                          ),
                        ],
                      ),
                    );
            }),
      ),
    );
  }

//Dynamically build list tile for drawer we can use as much as we want.
  Widget buildListTile(
    BuildContext context, {
    required String label,
    required Widget widget,
    required IconData icon,
  }) {
    return ListTile(
      title: Text(label),
      trailing: Icon(icon),
      onTap: () => navigate(
        context,
        widget,
      ),
    );
  }

  destinationCard(
    BuildContext context, {
    required String destinationName,
    required String destinationDescription,
    required String imageUrl,
  }) {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.height * 2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  SizeConfig.height * 2,
                ),
                child: imageUrl.isEmpty
                    ? Image.network(
                        ImageConstants.imageDestinationUrl,
                        fit: BoxFit.cover,
                      )
                    : Image.memory(
                        base64Decode(imageUrl),
                      ),
              ),
              Positioned(
                bottom: 7,
                right: 10,
                child: Container(
                  width: SizeConfig.width * 50,
                  height: SizeConfig.height * 6,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 111, 112, 112),
                    borderRadius: BorderRadius.circular(
                      SizeConfig.height * 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      destinationName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: SizeConfig.height * 2.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
