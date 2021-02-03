import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Bila Membutuhkan Bantuan Kirim Saja Ajuan anda ke Akun Gmail kami atau Customer Care Kami"),
            Text("TriipleStore@gmail.com"),
          ],
        ),
      ),
    );
  }
}
