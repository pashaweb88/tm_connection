import 'package:flutter/material.dart';
import 'package:tm_connections/strings/strings.dart';
import 'package:tm_connections/widgets/background.dart';
import 'package:tm_connections/widgets/connect_btn.dart';
import 'package:tm_connections/widgets/geo_button.dart';
import 'package:tm_connections/widgets/navbar.dart';
import 'package:tm_connections/widgets/server_list.dart';
import 'package:tm_connections/widgets/subscribe_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:tm_connections/widgets/terms.dart';

class ConnectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(
            imgUrl: AppStrings.BACKGROUND_GREY,
          ),
          PageContent(),
          // TermsWidget(),
        ],
      ),
    );
  }
}

class PageContent extends StatefulWidget {
  const PageContent({Key? key}) : super(key: key);

  @override
  _PageContentState createState() => _PageContentState();
}

class _PageContentState extends State<PageContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double _liseOffset = 500;
  @override
  void initState() {
    super.initState();
    // #Begin
    // Some initial loginc
    // Vpn prepare
    // firebase load
    // (Maybe subscribtion)
    // #Endd
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 1000,
    );

    _controller.addListener(() {
      print(_controller.value.toStringAsFixed(4));
      setState(() {});
    });

    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Navbar(),
              Spacer(),
              ConnectButton(),
              Text('Unable'),
              Spacer(),
              GeoButton(
                handler: () {
                  _geoButtonHandler();
                },
              ),
              SubscribeButton(),
            ],
          ),
          // List future
          AnimatedPositioned(
            child: Container(
              height: size.height,
              width: size.width,
              child: ServerList(closeHandler: _geoButtonHandler),
            ),
            duration: Duration(milliseconds: 500),
            top: _liseOffset,
            curve: Curves.easeInOutBack,
          ),
        ],
      ),
    );
  }

  void _geoButtonHandler() {
    setState(() {
      _liseOffset = _liseOffset == 300 ? 0 : 300;
    });
  }

// AnimatedPositioned(
//             child: _serverListBlock(),
//             duration: const Duration(milliseconds: 500),
//             top: 0.1,
//           )
  // Widget _serverListBlock() {
  //   return
  // }
}
