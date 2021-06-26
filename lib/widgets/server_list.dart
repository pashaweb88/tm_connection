import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ServerList extends StatelessWidget {
  Function closeHandler;
  ServerList({Key? key, required this.closeHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Container(
          width: double.infinity,
          alignment: Alignment.centerRight,
          color: Colors.white,
          child: TextButton(
            child: Text('Done'),
            onPressed: () {
              closeHandler();
            },
          ),
        ),
        Container(
          color: Colors.grey[200],
          height: 250,
          child: CupertinoPicker(
            diameterRatio: 1.2,
            itemExtent: 50.0,
            onSelectedItemChanged: (int index) {
              print(index);
            },
            children: [
              Text('Argenntina'),
              Text('Denmark'),
              Text('Armenia'),
              Text('Meduza'),
              Text('Trista'),
            ],
          ),
        ),
      ],
    );
  }
}
