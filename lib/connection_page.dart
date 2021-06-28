import 'package:flutter/material.dart';
import 'package:tm_connections/strings/strings.dart';
import 'package:tm_connections/widgets/background.dart';
import 'package:tm_connections/widgets/connect_btn.dart';
import 'package:tm_connections/widgets/geo_button.dart';
import 'package:tm_connections/widgets/navbar.dart';
import 'package:tm_connections/widgets/server_list.dart';
import 'package:tm_connections/widgets/subscribe_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vpn/flutter_vpn.dart';

//import 'package:tm_connections/widgets/terms.dart';

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

class _PageContentState extends State<PageContent> {
  bool isListHow = false;
  @override
  void initState() {
    FlutterVpn.prepare();
    FlutterVpn.onStateChanged.listen((state) {
      print('state - $state');
    });
    super.initState();
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
              ConnectButton(
                connectHandler: () {
                  print('start');
                  FlutterVpn.simpleConnect(
                          'topvpnus1.site', 'vpnuser', 'EsJx84Fqr8cAEba')
                      .then((value) {
                    print('daone');
                  });
                  print('after');
                },
              ),
              Spacer(),
              Text('Unable'),
              SizedBox(height: 20),
              GeoButton(
                handler: () {
                  _geoButtonHandler();
                },
              ),
              SizedBox(height: 20),
              SubscribeButton(),
            ],
          ),
          // List future
          AnimatedPositioned(
            child: Container(
              height: size.height,
              width: size.width,
              child: ServerList(closeHandler: () {
                setState(() {
                  isListHow = false;
                });
              }),
            ),
            duration: Duration(milliseconds: 500),
            top: isListHow ? 0 : 300,
            curve: Curves.easeInOutBack,
          ),
        ],
      ),
    );
  }

  void _geoButtonHandler() {
    setState(() {
      isListHow = true;
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
