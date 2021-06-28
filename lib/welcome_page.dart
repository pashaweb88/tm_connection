import 'package:flutter/material.dart';
import 'package:tm_connections/strings/strings.dart';
import 'package:tm_connections/widgets/navbar.dart';
import 'package:tm_connections/widgets/terms.dart';

class WelcomePageText {
  static const String TITLE_MAIN = 'Real-time protection';
  static const String TITLE_ASIDE =
      'Secure and anonymous connection, connecting and opening any services and sites';
  static const String BUTTON_SUBSCRIBE = 'START AND SUBSCRIBE';
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  static const double marginElems = 20;
  bool isTermsShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _background(),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Navbar(),
                Spacer(),
                _titleMain(),
                SizedBox(height: marginElems),
                _titleAside(),
                SizedBox(height: marginElems),
                _subscribeButton(),
                SizedBox(height: marginElems),
                Text('3 days free, then 749.00 ₽/week'),
                SizedBox(height: marginElems),
                Spacer(),
                _termsButton(),
                SizedBox(height: marginElems),
              ],
            ),
          ),
          Positioned.fill(
            //bottom: isTermsShow ? 0 : MediaQuery.of(context).size.height,
            bottom: isTermsShow ? 0 : MediaQuery.of(context).size.height,
            child: TermsWidget(
              closeHandler: () {
                setState(() {
                  isTermsShow = false;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _titleMain() {
    return Text(
      WelcomePageText.TITLE_MAIN.toUpperCase(),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: Color(AppColors.TITLE_COLOR),
      ),
    );
  }

  Widget _titleAside() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Text(
        WelcomePageText.TITLE_ASIDE,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Color(AppColors.TITLE_COLOR),
        ),
      ),
    );
  }

  Widget _background() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage(AppStrings.BACKGROUND_WHITE),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _subscribeButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/main');
      },
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
            WelcomePageText.BUTTON_SUBSCRIBE,
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

  Widget _termsButton() {
    return Opacity(
      opacity: 0.4,
      child: TextButton(
        onPressed: () {
          setState(() {
            isTermsShow = true;
          });
        },
        child: Text(
          'Terms of Use',
          style: TextStyle(
            color: Color(AppColors.GRADIENT_FIRST),
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
