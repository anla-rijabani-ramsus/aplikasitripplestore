import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripplestore/components/product_card.dart';
import 'package:tripplestore/models/Product.dart';
import 'package:tripplestore/service/service.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return SafeArea(
      child: StreamBuilder<QuerySnapshot>(
        stream: Fireservice.getfavorite(user.uid),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center (child:CircularProgressIndicator());
          }

          var listProduct = snapshot.data.docs.map((e) => Product(
            id: int.parse(e.id),
            images: e.data()["images"],
            colors: e.data()["colors"],
            description: e.data()["description"],
            price: e.data()["price"],
            title: e.data()["title"],
            isFavourite: e.data()["isfavorite"],
            isPopular: e.data()["ispopular"],
            rating: e.data()["rating"],

          ),).toList();
          return SingleChildScrollView(
            child: Wrap(
              children: [
                
              ...List.generate(
                listProduct.length,
                (index) {
                  if (listProduct[index].isPopular)
                    return ProductCard(product: listProduct[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            
              ],
            ),
          );
        }
      ),
    );
  }
}
