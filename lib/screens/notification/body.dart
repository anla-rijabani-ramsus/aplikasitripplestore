import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Barang Anda Sudah ada Di Keranjang , Apakah akan anda ingin Membeli ?"),
          ],
        ),
      ),
    );
  }
}
