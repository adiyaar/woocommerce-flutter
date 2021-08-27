import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nyoba/constant/constants.dart';
import 'package:nyoba/pages/intro/IntroScreen.dart';
import 'package:nyoba/pages/home/HomeScreen.dart';
import 'package:nyoba/provider/GeneralSettingsProvider.dart';
import 'package:nyoba/services/Session.dart';
import 'package:nyoba/utils/utility.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  final Future Function() onLinkClicked;
  SplashScreen({Key key, this.onLinkClicked}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startSplashScreen(intro) async {
    var duration = const Duration(milliseconds: 2500);

    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return Session.data.getBool('isIntro')
            ? HomeScreen()
            : IntroScreen(
                intro: intro.intro,
              );
      }));
      if (widget.onLinkClicked != null) {
        print("URL Available");
        widget.onLinkClicked();
      }
    });
  }

  loadIntro() async {
    final intro = Provider.of<GeneralSettingsProvider>(context, listen: false);
    await intro.fetchIntroPage().then((value){
      startSplashScreen(intro);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!Session.data.containsKey('isIntro')) {
      Session.data.setBool('isLogin', false);
      Session.data.setBool('isIntro', false);
    }
    printLog(widget.onLinkClicked.toString());
    loadIntro();
  }

  @override
  Widget build(BuildContext context) {
    final intro = Provider.of<GeneralSettingsProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Consumer<GeneralSettingsProvider>(builder: (context, value, child) {
          if (value.loading) {
            return Container();
          }else{
            startSplashScreen(intro);
          }
          return Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      child: Image.network(value.splashscreen.image),
                    ),
                    Text(
                      value.splashscreen.title,
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      value.splashscreen.description,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.bottomCenter,
                child: Text("Version $version",
                  style: TextStyle(fontSize: 14),
                ),
              )
            ],
          );
        })
      ),
    );
  }
}
