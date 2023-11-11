import 'package:flutter/material.dart';

import 'Screen/image_list_screen.dart';
void main(){
  runApp(const PicList());
}
class PicList extends StatelessWidget {
  const PicList({super.key});

  @override
  Widget build(BuildContext context) {
    return
      const MaterialApp(
        home: ImageListScreen(),
      );
  }
}
