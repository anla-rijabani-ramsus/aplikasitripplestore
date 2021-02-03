import 'package:flutter/material.dart';
import 'package:tripplestore/components/coustom_bottom_nav_bar.dart';
import 'package:tripplestore/enums.dart';

import 'body.dart';


class NotificationScreen extends StatelessWidget {
  static String routeName = "/notification";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
