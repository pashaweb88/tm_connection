import 'package:flutter/material.dart';

class TermsWidget extends StatelessWidget {
  const TermsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.amber,
        width: MediaQuery.of(context).size.width - 100,
        height: MediaQuery.of(context).size.height - 100,
        child: Text('terms'),
      ),
    );
  }
}
