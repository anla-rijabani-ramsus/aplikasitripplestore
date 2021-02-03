import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tripplestore/models/Product.dart';

class Fireservice {
  static var _auth = FirebaseAuth.instance;

  static Stream<User> get userStream => _auth.authStateChanges();

  static Future<String> signup(
      {String nama,String phoneNumber,String address, String email, String password}) async {
    try {
      var _result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await dataUser(id: _result.user.uid, email: email, nama: nama, phoneNumber: phoneNumber, address:address);
      return "Signup Berhasil";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  static Future<String> signin(String email, String password) async {
    try {
      var _result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signin Berhasil";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  static Future<void> signout() async {
    await _auth.signOut();
  }

  static var _userCollection = FirebaseFirestore.instance.collection('user');
  static Future<void> updateProfile(String id, String profile) async {
    await _userCollection.doc(id).set({
      "profile": profile,
    }, SetOptions(merge: true));
  }

  static Future<void> dataUser({
    String id,
    String nama,
    String email,
    String phoneNumber,
    String address,
  }) async {
    await _userCollection.doc(id).set(
        {
          "id": id,
          "nama": nama,
          "phoneNumber": phoneNumber,
          "address":address,
          "email": email,
          "profile": "",
        },
        SetOptions(
          merge: true,
        ));
  }

  static Stream<DocumentSnapshot> getdataUser(String id)  {
    return _userCollection.doc(id).snapshots();
  }

  static Future<String> addfavorite({
    String id,
    Product product,
  }) async {
    await _userCollection.doc(id).collection("favorite").doc(product.id.toString()).set({
      "title":product.title,
      "images":product.images,
      "colors":[],
      "price":product.price,
      "description":product.description,
      "rating":product.rating,
      "isfavorite":true,
      "ispopular":true,
    });
  }
  static Stream<QuerySnapshot> getfavorite(String id)  {
    return _userCollection.doc(id).collection("favorite").snapshots();
  }
}