import 'package:flutter/material.dart';
import 'package:tm_connections/models/server.dart';
import 'package:tm_connections/strings/strings.dart';

class GeoButton extends StatelessWidget {
  final int choosenIndex;
  final Function handler;
  GeoButton({Key? key, required this.handler, required this.choosenIndex})
      : super(key: key);

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
                image: AssetImage('assets/images/' +
                    Server.allServers()[choosenIndex].flag +
                    '.png'),
                fit: BoxFit.cover,
              ),
              Spacer(),
              Text(Server.allServers()[choosenIndex].coyntry),
              Spacer(),
              Icon(Icons.arrow_drop_up, color: Colors.grey[800]),
            ],
          ),
        ));
  }
}
