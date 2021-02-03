import 'package:flutter/material.dart';
import 'package:tripplestore/components/coustom_bottom_nav_bar.dart';
import 'package:tripplestore/enums.dart';

import 'components/body.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = "/favorite";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
