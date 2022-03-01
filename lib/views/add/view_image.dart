import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myassigment/constants/colors.dart';

class ViewImage extends StatelessWidget {
  const ViewImage({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appBar,
        title: const Text('Product Image'),
        leading: Builder(
          builder: (BuildContext context) => GestureDetector(
            child: const Icon(
              Icons.chevron_left_sharp,
              size: 32,
            ),
            onTap: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: image == ''
            ? Image.asset('assets/img/login.png')
            : Image.file(
                File(image),
              ),
      ),
    );
  }
}
