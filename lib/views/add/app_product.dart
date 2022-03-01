import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myassigment/constants/colors.dart';
import 'package:myassigment/controller/services_provider.dart';
import 'package:myassigment/models/product.dart';
import 'package:myassigment/views/add/view_image.dart';
import 'package:myassigment/widgets/forms.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  static const routeName = '/add';
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String name = '';
  String description = '';
  String image = '';
  String price = '';

  final _formKey = GlobalKey<FormState>();

  //
  late String _image = '';
  late int img = 0;

  final _picker = ImagePicker();
  getImage(ImageSource source) async {
    XFile? pickedFile = await _picker.pickImage(source: source);
    File _imageFile = File(pickedFile!.path);

    //
    // var _compressedFile = await FlutterImageCompress.compressAndGetFile(
    //     _imageFile.path, _imageFile.path, quality: 80);
    // File compressed = File(_compressedFile!.path);
    //
    // var result = await FlutterImageCompress.compressAndGetFile(
    //   _imageFile.path,
    //   _imageFile.path,
    //   quality: 88,
    //   rotate: 180,
    // );
    // File compressed = await customCompressed(imagePath: _imageFile);
    // File compressed = File(result!.path);
    setState(() {
      print(_imageFile.lengthSync());
      _image = _imageFile.path;
      img = _imageFile.lengthSync();
    });
  }

  // Future<File> customCompressed(
  //     {required File imagePath, quality = 100, percentage = 10}) async {
  //   var path = await FlutterNativeImage.compressImage(imagePath.absolute.path,
  //       quality: 100, percentage: 10);
  //   print(path.toString());
  //   return path;
  // }

  @override
  Widget build(BuildContext context) {
    var serviceController = Provider.of<ServiceProvider>(context);
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appBar,
        title: const Text('Add New Product'),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Add New Product',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) => setState(() => name = value),
                      decoration: Forms.textFromFieldDecoration(
                          label: "Product name*", hint: "Enter product name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Product name cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) => setState(() => price = value),
                      decoration: Forms.textFromFieldDecoration(
                          label: "Product price*", hint: "Enter product price"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Product price cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      onChanged: (value) => setState(() => description = value),
                      decoration: Forms.textFromFieldDecoration(
                          label: "Description*", hint: "Enter description"),
                      maxLines: 5,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Description cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          'Add Image:',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                        _image == ''
                            ? const Text(
                                'No image',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 18),
                              )
                            : const Text(
                                'Image selected',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 18),
                              ),
                        const SizedBox(width: 5),
                        _image == ''
                            ? const Icon(Icons.cancel_outlined,
                                color: Colors.red)
                            : const Icon(Icons.check_circle_outline_rounded,
                                color: Colors.green),
                        const SizedBox(width: 8),
                        _image == ''
                            ? const Text('')
                            : GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ViewImage(image: _image),
                                  ),
                                ),
                                child: const Text(
                                  'View',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 18),
                                ),
                              ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => getImage(ImageSource.gallery),
                          icon: const Icon(
                            Icons.add_photo_alternate_rounded,
                            size: 38,
                          ),
                        ),
                        IconButton(
                          onPressed: () => getImage(ImageSource.camera),
                          icon: const Icon(
                            Icons.add_a_photo,
                            size: 36,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        var user = FirebaseAuth.instance.currentUser;
                        if (_formKey.currentState!.validate() && _image != '') {
                          Sender sender = Sender(
                              name: user!.displayName.toString(),
                              email: user.email.toString());
                          Product product = Product(
                              name: name,
                              description: description,
                              image: _image,
                              price: price,
                              sender: sender);
                          serviceController.addProduct(product);
                          Navigator.pop(context);
                        }
                      },
                      child: Forms.button(title: 'Add Product', w: w),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
