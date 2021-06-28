import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final String imgUrl;
  Background({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage(imgUrl),
        fit: BoxFit.cover,
      ),
    );
  }
}
