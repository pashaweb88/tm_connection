import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_navbarBackground(), _navbarLogo()],
    );
  }

  Widget _navbarLogo() {
    return Container(
      height: 150,
      alignment: Alignment.bottomCenter,
      child: Image(
          image: AssetImage('assets/images/navbar_logo.png'),
          fit: BoxFit.cover),
    );
  }

  Widget _navbarBackground() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(color: Colors.white, boxShadow: _boxShadow()),
    );
  }

  List<BoxShadow> _boxShadow() {
    return [
      BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3))
    ];
  }
}
