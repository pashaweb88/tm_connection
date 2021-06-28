import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tm_connections/models/server.dart';
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
  int choosenServerIndex = 0;
  var connectState = FlutterVpnState.disconnected;

  @override
  void initState() {
    _getSaveIndex();
    FlutterVpn.prepare();
    FlutterVpn.onStateChanged.listen((state) {
      connectState = state;
      setState(() {});
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
                connectHandler: _connectHandler,
                conState: connectState,
              ),
              Spacer(),
              Text('Unable'),
              SizedBox(height: 20),
              GeoButton(
                choosenIndex: choosenServerIndex,
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
              child: ServerList(
                  chooseHandler: _chooseHandler,
                  closeHandler: _listCloseHandler,
                  serverList: Server.allServers()),
            ),
            duration: Duration(milliseconds: 500),
            top: isListHow ? 0 : 300,
            curve: Curves.easeInOutBack,
          ),
        ],
      ),
    );
  }

  void _chooseHandler(int index) {
    setState(() {
      choosenServerIndex = index;
    });
  }

  Future<void> _listCloseHandler() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', choosenServerIndex);
    setState(() {
      isListHow = false;
    });
  }

  Future<void> _getSaveIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('counter') ?? 0;
    setState(() {
      choosenServerIndex = counter;
    });
  }

  void _connectHandler() {
    if (connectState == FlutterVpnState.connected) {
      FlutterVpn.disconnect();
    } else {
      FlutterVpn.simpleConnect('topvpnus1.site', 'vpnuser', 'EsJx84Fqr8cAEba');
    }
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
