import 'package:flutter/material.dart';
import 'package:myassigment/constants/colors.dart';
import 'package:myassigment/controller/services_provider.dart';
import 'package:myassigment/views/add/app_product.dart';
import 'package:myassigment/widgets/drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var serviceController = Provider.of<ServiceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appBar,
        title: const Text('Products'),
        leading: Builder(
          builder: (BuildContext context) => GestureDetector(
            child: Image.asset('assets/img/menu_icon.png'),
            onTap: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: Scaffold(
        body: RefreshIndicator(
          child: serviceController.getProducts(),
          onRefresh: serviceController.refereceProductList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.appBar,
        onPressed: () => Navigator.pushNamed(context, AddProduct.routeName),
        child: const Icon(Icons.add),
      ),
      drawer: const MyDrawer(),
    );
  }
}
