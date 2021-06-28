import 'package:flutter/material.dart';
import 'package:tm_connections/strings/strings.dart';

class TermsWidget extends StatelessWidget {
  final Function closeHandler;

  TermsWidget({Key? key, required this.closeHandler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0xAA000000),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          width: MediaQuery.of(context).size.width - 50,
          height: MediaQuery.of(context).size.height - 50,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Title'),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: MediaQuery.of(context).size.height - 250,
                  child: SingleChildScrollView(
                    child: Text(
                      terms_content,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              )),
              _subscribeButton(),
              _closeButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _subscribeButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(AppColors.GRADIENT_FIRST),
              Color(AppColors.GRADIENT_SECOND),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: 250,
          height: 40,
          alignment: Alignment.center,
          child: Text(
            'I agree',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _closeButton() {
    return Opacity(
      opacity: 0.4,
      child: TextButton(
        onPressed: () {
          closeHandler();
        },
        child: Text(
          'Close',
          style: TextStyle(
            color: Color(AppColors.GRADIENT_FIRST),
          ),
        ),
      ),
    );
  }
}
