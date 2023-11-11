import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'image_detail.dart';
import 'image_item.dart';

class ImageListScreen extends StatefulWidget {
  const ImageListScreen({super.key});

  @override
  State<ImageListScreen> createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  List<ImageItem> imageList = [];

  void getImageList() async {
    Response response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    print(response.statusCode);
    print(response.body);
    print(response.request!.url);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> jsonData in jsonDecode(response.body)) {
        imageList.add(ImageItem(
            jsonData['albumId'],
            jsonData['id']??'',
            jsonData['title']??'',
            jsonData['url']??'',
            jsonData['thumbnailUrl']??''));
        print(jsonData);
      }
    }
    setState(() {});
  }
  @override
  void initState() {
    getImageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('আল মুতা’আলী – সৃষ্টির গুণাবলীর উর্দ্ধে'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
                title: Text('${imageList[index].title}'),
                leading: SizedBox(
                  width: 90,
                  height: 80,
                  child: ListTile(
                      onTap: () {
                        final ImageItem imL=imageList[index];
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageDetail(imL: imL,)));
                      },
                      title: Image.network('${imageList[index].thumbnailUrl}',
                        width: 50,
                        height: 50,
                      )),
                ));
          },
          itemCount: imageList.length,
        ));
  }
}
