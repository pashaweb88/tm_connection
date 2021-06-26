import 'package:flutter/material.dart';
import 'package:tm_connections/strings/strings.dart';
import 'package:tm_connections/widgets/background.dart';
import 'package:tm_connections/widgets/navbar.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    print(14 + 8);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: Image(
              image: AssetImage(AppStrings.BACKGROUND_WHITE),
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Navbar(),
                Text('Real-time protection'),
                Text(
                    'Secure and anonymous connection, connecting and opening any services and sites'),
                ElevatedButton(
                    onPressed: () {
                      // todo:Davaikin
                    },
                    child: Text('START AND SUBSCRIBE')),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/main');
                  },
                  child: Text('Davai'),
                ),
                Text('3 days free, then 749.00 ₽/week'),
                TextButton(onPressed: () {}, child: Text('Terms of Use'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
