import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myassigment/controller/services_provider.dart';
import 'package:provider/provider.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    var serviceController = Provider.of<ServiceProvider>(context);
    double w = MediaQuery.of(context).size.width;
    return Card(
      elevation: 8.0,
      // color: Colors.blueGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: FadeInImage(
              image: FileImage(
                File(serviceController.products[index].image),
              ),
              placeholder: const AssetImage('assets/img/myloading.png'),
              width: 120,
              height: 120,
              fit: BoxFit.fill,
            ),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                    child: SizedBox(
                      width: w - 148,
                      child: Text(
                        serviceController.products[index].name,
                        style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: w - 148,
                      child: Text(
                        serviceController.products[index].description,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 13.0),
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Wrap(
                        children: [
                          Text(
                            '₹ ',
                            style: TextStyle(
                                color: Colors.green.shade800,
                                fontWeight: FontWeight.w800,
                                fontSize: 18),
                          ),
                          Text(
                            serviceController.products[index].price.toString(),
                            style: const TextStyle(
                                // color: Colors.green.shade900,
                                fontWeight: FontWeight.w300,
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
                    child: SizedBox(
                      width: w - 148,
                      child: Text(
                        'Sender: ${serviceController.products[index].sender.email}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.grey.shade600.withOpacity(0.5)),
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
