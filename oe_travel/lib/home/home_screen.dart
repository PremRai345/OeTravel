import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oe_travel/Admin/destination_detail.dart';
import 'package:oe_travel/Admin/destination_provider.dart';
import 'package:oe_travel/Admin/destination_screen.dart';
import 'package:oe_travel/Admin/settings.dart';
import 'package:oe_travel/Login-Register/profile_screen.dart';
import 'package:oe_travel/providers/user_provider.dart';

import 'package:oe_travel/utils/navigate.dart';
import 'package:provider/provider.dart';

import '../utils/size_config.dart';
import '../widgets/curved_body_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  final String imageOfDestination =
      "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  final image =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";

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
              return UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 179, 134, 1),
                ),
                accountName: Text(data.user.name ?? "No Name Provided"),
                accountEmail: Text(data.user.email ?? "No Email Provided"),
                currentAccountPicture: Hero(
                  tag: "image-hero",
                  child: SizedBox(
                    height: SizeConfig.height * 16,
                    width: SizeConfig.height * 16,
                    child: GestureDetector(
                      //When user tap on image navigae to profile screen
                      onTap: () => navigate(
                        context,
                        ProfileScreen(
                          imageUrl: image,
                        ),
                      ),
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

            buildListTile(
              context,
              label: "Settings",
              widget: const Settings(),
              icon: Icons.settings,
            ),
            buildListTile(context,
                label: "Add Destination",
                widget: AddDestination(
                  destinationImageUrl: imageOfDestination,
                ),
                icon: Icons.travel_explore_outlined),

            SizedBox(
              height: SizeConfig.height * 28,
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
                                  imageUrl: imageOfDestination,
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

  Card destinationCard(
    BuildContext context, {
    required String destinationName,
    required String destinationDescription,
    required String imageUrl,
  }) {
    return Card(
      elevation: 2,
      shadowColor: Colors.grey,
      color: Color.fromARGB(255, 240, 236, 236),
      child: Padding(
        padding: EdgeInsets.all(
          SizeConfig.height,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.height * 12,
              width: SizeConfig.height * 12,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                  scale: 2,
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.width * 4,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destinationName,
                  style: const TextStyle(
                    fontFamily: "SanFrancisco",
                    color: Color.fromARGB(255, 118, 119, 119),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: SizeConfig.height),
                Row(
                  children: [
                    const Icon(
                      Icons.card_travel,
                      color: Colors.grey,
                    ),
                    Text(
                      destinationDescription,
                      style: const TextStyle(
                        fontFamily: "SanFrancisco",
                        color: Color.fromARGB(255, 118, 119, 119),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text("..."),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
