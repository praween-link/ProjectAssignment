import 'package:flutter/material.dart';
import 'package:myassigment/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myassigment/widgets/product_list_view.dart';

class ServiceProvider extends ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  List<Product> products = [];
  bool isLoading = true;
  
  void addProduct(Product product) {
    _firestore.collection('Products').add({
      'name': product.name,
      'description': product.description,
      'image': product.image,
      'price': product.price,
      'sender': {'name': product.sender.name, 'email': product.sender.email}
    }).then((value) => null);
    ChangeNotifier();
  }

  getProducts() {
    isLoading = true;
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('Products').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //--------------
        products = [];
        if (snapshot.hasData) {
          var data = snapshot.data!.docs;
          for (var d in data) {
            Sender sender = Sender(
              name: d['sender']['name'],
              email: d['sender']['email'],
            );
            Product product = Product(
              name: d['name'],
              description: d['description'],
              image: d['image'],
              price: d['price'],
              sender: sender,
            );
            products.add(product);
          }
          isLoading = false;
          return ProductListView(data: data);
        } else if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  //
  Future<void> refereceProductList() async {
    products = [];
    // limitedItem = 10;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    getProducts();
    notifyListeners();
  }
  

  //-----------
  // void totalProducts() async {
  //   await for (var snapshot
  //       in FirebaseFirestore.instance.collection('Products').snapshots()) {
  //     totalProduct = snapshot.docs.length;
  //   }
  //   notifyListeners();
  // }
}
