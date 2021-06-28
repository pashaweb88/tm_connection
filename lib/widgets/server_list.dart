import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tm_connections/models/server.dart';

class ServerList extends StatelessWidget {
  final List<Server> serverList;
  final Function closeHandler;
  final Function chooseHandler;
  const ServerList(
      {Key? key,
      required this.closeHandler,
      required this.serverList,
      required this.chooseHandler})
      : super(key: key);

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
              chooseHandler(index);
            },
            children: serverList.map((e) => Text(e.coyntry)).toList(),
          ),
        ),
      ],
    );
  }
}
