// ignore: file_names
import 'package:carxproje/utils/EmlakColors.dart';
import 'package:carxproje/utils/EmlakConstans.dart';
import 'package:carxproje/views/welcomepage.dart';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent);
    await 3.seconds.delay;
    // ignore: use_build_context_synchronously
    const WelcomeScreen().launch(context, isNewTask: true);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jcbSecBackGroundColor,
      body: SizedBox(
        height: context.height(),
        width: context.width(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: context.statusBarHeight + 50),
                Text('CarX',
                    style: boldTextStyle(
                        size: 28,
                        fontFamily: jcbFont,
                        color: jcbDarkColor,
                        weight: FontWeight.w900)),
                Text('Promotion',
                    style: boldTextStyle(
                        size: 28,
                        fontFamily: jcbFont,
                        color: jcbDarkColor,
                        weight: FontWeight.w900)),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Image.asset(
                  'images/juberCarBooking/jcb_splash_background_image.png',
                  width: context.width(),
                  fit: BoxFit.cover),
            ),
            Image.asset('images/juberCarBooking/jcbGifs/jcb_loader.gif',
                color: jcbDarkColor, width: 50, height: 50),
          ],
        ),
      ),
    );
  }
}
