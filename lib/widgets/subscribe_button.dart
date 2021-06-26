import 'package:flutter/material.dart';

class SubscribeButton extends StatelessWidget {
  const SubscribeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: const <Color>[Color(0xffee00ff), Color(0xffeeeeff)],
        ),
      ),
      child: OutlinedButton(
        onPressed: () {
          print('temper');
        },
        child: Container(
          child: Stack(
            children: [Text('GET PREMIUM')],
          ),
        ),
      ),
    );
  }
}
