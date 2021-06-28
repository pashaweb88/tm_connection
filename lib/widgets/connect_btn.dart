import 'package:flutter/material.dart';

class ConnectButton extends StatefulWidget {
  Function connectHandler;
  ConnectButton({Key? key, required this.connectHandler}) : super(key: key);

  @override
  _ConnectButtonState createState() => _ConnectButtonState();
}

class _ConnectButtonState extends State<ConnectButton> {
  double size = 200;
  bool isButtonActive = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        size = size == 200 ? 100 : 200;
        isButtonActive = !isButtonActive;
        widget.connectHandler();
        setState(() {});
      },
      child: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOutBack,
          width: size,
          height: size,
          child: isButtonActive
              ? _btnImage(path: 'assets/images/main_btn.png')
              : _btnImage(path: 'assets/images/main_btn_grey.png'),
        ),
      ),
    );
  }

  Widget _btnImage({required String path}) {
    return Image(
      image: AssetImage(path),
      fit: BoxFit.cover,
    );
  }
}
