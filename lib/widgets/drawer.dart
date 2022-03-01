import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myassigment/constants/colors.dart';
import 'package:myassigment/services/auth.dart';
import 'package:myassigment/views/add/app_product.dart';
import 'package:myassigment/views/login/login_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: MyColors.appBar.withOpacity(0.9),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user!.displayName.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 22),
                ),
                Text(
                  user.email.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add_to_photos),
            title: const Text('Add New Product'),
            onTap: () => Navigator.pushNamed(context, AddProduct.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              GoogleFirebaseAuth.signOut();
              Navigator.pushNamed(context, LoginScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
