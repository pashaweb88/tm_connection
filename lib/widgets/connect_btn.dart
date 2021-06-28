import 'package:flutter/material.dart';
import 'package:flutter_vpn/flutter_vpn.dart';

// 0 - disconnect
// 1 - connecting
// 2 - connect
// 3 - error

class ConnectButton extends StatelessWidget {
  final FlutterVpnState conState;
  final Function connectHandler;
  const ConnectButton(
      {Key? key, required this.connectHandler, required this.conState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // size = size == 200 ? 100 : 200;
        // isButtonActive = !isButtonActive;
        connectHandler();
      },
      child: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOutBack,
          width: conState == FlutterVpnState.connecting ? 150 : 200,
          height: conState == FlutterVpnState.connecting ? 150 : 200,
          child: conState == FlutterVpnState.connected
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

// class ConnectButton extends StatefulWidget {
//   final double size;
//   final bool isActive;
//   final Function connectHandler;

//   const ConnectButton(
//       {Key? key,
//       required this.connectHandler,
//       required this.size,
//       required this.isActive})
//       : super(key: key);

//   @override
//   _ConnectButtonState createState() => _ConnectButtonState();
// }

// class _ConnectButtonState extends State<ConnectButton> {
//   // double size = 200;
//   // bool isButtonActive = true;

// }
