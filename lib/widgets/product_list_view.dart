import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myassigment/controller/services_provider.dart';
import 'package:myassigment/widgets/card.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key, required this.data}) : super(key: key);

  final List<QueryDocumentSnapshot<Object?>> data;

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    var serviceController = Provider.of<ServiceProvider>(context);
    return Column(
      children: [
        Expanded(
          child: serviceController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: serviceController.products.length,
                  itemBuilder: (context, index) {
                    return MyCard(index: index);
                  },
                ),
                
        ),
      ],
    );
  }
}
