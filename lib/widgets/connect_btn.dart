import 'package:flutter/material.dart';

class ConnectButton extends StatelessWidget {
  const ConnectButton({Key? key}) : super(key: key);

  dispose() {}
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        CustomPaint(
          painter: ButtonCanvas(),
        ),
        // _btnImage(path: 'assets/images/main_btn_grey.png'),
        // _btnImage(path: 'assets/images/main_btn.png'),
      ],
    ));
  }

  Widget _btnImage({required String path}) {
    return Image(
      image: AssetImage(path),
      fit: BoxFit.cover,
    );
  }
}

class ButtonCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    var _paint = Paint()

      // _paint.shader = ui.Gradient.linear(
      //     Offset(0, 0), Offset(100, 100), [Color(0x00695ED8), Color(0x008640D6)]);

      ..shader = RadialGradient(colors: [Color(0xFF695ED8), Color(0xFF8640D6)])
          .createShader(Rect.fromCircle(center: center, radius: 75));

    canvas.drawCircle(center, 150, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
