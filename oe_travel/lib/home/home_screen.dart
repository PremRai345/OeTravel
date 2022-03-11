import 'package:flutter/material.dart';
import 'package:oe_travel/Login-Register/profile_screen.dart';
import 'package:oe_travel/providers/user_provider.dart';
import 'package:oe_travel/theme/theme_data.dart';

import 'package:oe_travel/utils/navigate.dart';
import 'package:provider/provider.dart';

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
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(data.user.image ?? image),
                    ),
                  ),
                );
              }),
              ListTile(
                title: Text("User Profile"),
                // use animated icon
                trailing: Icon(
                  Icons.person,
                ),
                // when user tap it will navigate to profile screen
                // navigation will be done using navigate function made on utils
                onTap: () => navigate(
                  context,
                  ProfileScreen(
                    imageUrl: image,
                  ),
                ),
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
}
