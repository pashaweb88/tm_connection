import 'package:flutter/material.dart';
import 'package:tm_connections/strings/strings.dart';
import 'package:tm_connections/widgets/background.dart';
import 'package:tm_connections/widgets/navbar.dart';

class SubscribtionPage extends StatelessWidget {
  const SubscribtionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SubscribtionPageContent(),
    );
  }
}

class SubscribtionPageContent extends StatefulWidget {
  const SubscribtionPageContent({Key? key}) : super(key: key);

  @override
  _SubscribtionPageContentState createState() =>
      _SubscribtionPageContentState();
}

class _SubscribtionPageContentState extends State<SubscribtionPageContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(imgUrl: AppStrings.BACKGROUND_GREY),
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Navbar(),
              Text('SUBSCRIBE'),
              _subButton1(),
              _subButton1(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _subButton1() {
    return ElevatedButton(
      onPressed: () {},
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(AppColors.GRADIENT_FIRST),
            Color(AppColors.GRADIENT_SECOND),
          ]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: 250,
          height: 40,
          alignment: Alignment.center,
          child: _buttonContentDoubleString('1-Day'),
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

  Widget _buttonContentDoubleString(String text) {
    return Column(
      children: [Spacer(), Text(text), Text('dava2'), Spacer()],
    );
  }

  Widget _buttonContentSingleText(String text) {
    return Text(text);
  }
}
