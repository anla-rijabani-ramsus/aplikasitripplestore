import 'package:flutter/material.dart';
import 'package:tripplestore/screens/help/help_screen.dart';
import 'package:tripplestore/screens/myaccount/account_screen.dart';
import 'package:tripplestore/screens/sign_in/sign_in_screen.dart';
import 'package:tripplestore/service/service.dart';



import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: ()  {
                Navigator.pushNamed(context, AccountScreen.routeName);

            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.pushNamed(context, HelpScreen.routeName);
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              Fireservice.signout();
               Navigator.pushNamedAndRemoveUntil(context, SignInScreen.routeName, (route) => false);           },
          ),
        ],
      ),
    );
  }
}
