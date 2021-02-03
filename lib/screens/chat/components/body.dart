import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Pertanyaan Produk"),
            Text("Nike Sport White - Man Pant"),
            Text("Apakah Barang Tersedia ?"),
          ],
        ),
      ),
    );
  }
}
