import 'package:flutter/material.dart';

import 'image_item.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({super.key, required this.imL});
 final ImageItem imL;
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: const Text('আস সাবুর – অত্যাধিক ধর্য্য ধারণকারী',style: TextStyle(fontSize: 18),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 18),
                child: Image.network(imL.url),
              ),
              Text('Title: ${imL.title}',),
              const SizedBox(height: 20,),
              Text('ID: ${imL.id.toString()}',style: const TextStyle(fontSize: 15),),
            ],
          ),
        ),
      );
  }
}
