import 'package:flutter/material.dart';
import 'package:tripplestore/components/coustom_bottom_nav_bar.dart';
import 'package:tripplestore/enums.dart';

import 'body.dart';


class SettingScreen extends StatelessWidget {
  static String routeName = "/setting";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
