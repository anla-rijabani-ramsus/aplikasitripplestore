import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripplestore/screens/sign_in/sign_in_screen.dart';
import 'package:tripplestore/service/service.dart';



import 'account_menu.dart';
import 'account_pic.dart';

class Body extends StatelessWidget {
  User user;
  @override
  Widget build(BuildContext context) {
  user = Provider.of<User>(context);
    return StreamBuilder<DocumentSnapshot>(
      stream: Fireservice.getdataUser(user.uid),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              AccountPic(),
              SizedBox(height: 20),
              AccountMenu(
                text: snapshot.data.data()["nama"],
                icon: "assets/icons/iconmonstr-id-card-1.svg",
                press: null,
              ),
              AccountMenu(
                text: snapshot.data.data()["email"],
                icon: "assets/icons/Mail.svg",
                press: null,
              ),
              AccountMenu(
                text: snapshot.data.data()["phoneNumber"],
                icon: "assets/icons/iconmonstr-phone-2.svg",
                press: null,
              ),
              AccountMenu(
                text: snapshot.data.data()["address"],
                icon: "assets/icons/iconmonstr-home-7.svg",
                press: null,
              ),
              
            ],
          ),
        );
      }
    );
  }
}
