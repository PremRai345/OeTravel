import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oe_travel/Admin/destination.dart';
import 'package:oe_travel/Admin/settings.dart';
import 'package:oe_travel/Login-Register/profile_screen.dart';
import 'package:oe_travel/providers/user_provider.dart';

import 'package:oe_travel/utils/navigate.dart';
import 'package:provider/provider.dart';

import '../utils/size_config.dart';
import '../widgets/curved_body_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
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
                label: "Add Destination",
                widget: AddDestination(
                  imageUrl: image,
                ),
                icon: Icons.travel_explore,
              ),
              buildListTile(
                context,
                label: "Settings",
                widget: const Settings(),
                icon: Icons.settings,
              ),

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
          widget: SingleChildScrollView(
            child: Column(
              children: const [
                Text("Travelling App"),
              ],
            ),
          ),
        ));
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
}
