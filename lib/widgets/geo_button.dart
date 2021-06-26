import 'package:flutter/material.dart';
import 'package:tm_connections/strings/strings.dart';

class GeoButton extends StatelessWidget {
  Function handler;
  GeoButton({Key? key, required this.handler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.grey[100],
          onPrimary: Colors.grey[500],
          elevation: 10,
          shape: StadiumBorder(),
        ),
        onPressed: () {
          handler();
        },
        child: Container(
          width: 300,
          height: 50,
          child: Row(
            children: [
              Image(
                width: 35,
                image: AssetImage(AppStrings.FLAG_US_IMAGE),
                fit: BoxFit.cover,
              ),
              Spacer(),
              Text('Germany'),
              Spacer(),
              Icon(Icons.arrow_drop_up, color: Colors.grey[800]),
            ],
          ),
        ));
  }
}
