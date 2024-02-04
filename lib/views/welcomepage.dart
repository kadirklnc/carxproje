import 'package:carxproje/utils/EmlakColors.dart';
import 'package:carxproje/utils/EmlakConstans.dart';
import 'package:carxproje/views/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  List<WalkThroughModelClass> walkThroughList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    walkThroughList.add(WalkThroughModelClass(
      title: 'Arabaları Sever misin?',
      subTitle: 'Peki arabalar hakkında ne kadar bilgilisin?',
      image: 'images/juberCarBooking/jcb_walkthrough1.png',
    ));
    walkThroughList.add(WalkThroughModelClass(
      title: 'Tüm Markalardan Arabalar',
      subTitle: '',
      image: 'images/juberCarBooking/jcb_walkthrough2.png',
    ));
    walkThroughList.add(WalkThroughModelClass(
      title: 'Arabaların Tüm Özellikleri',
      subTitle: '',
      image: 'images/juberCarBooking/jcb_walkthrough3.png',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jcbSecBackGroundColor,
      body: Column(
        children: [
          SizedBox(
            height: context.height() * 0.88,
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                currentPage = index;
                setState(() {});
              },
              children: walkThroughList.map((e) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.statusBarHeight + 30),
                    Text(
                      e.title.validate(),
                      style: boldTextStyle(
                        size: 34,
                        fontFamily: jcbFont,
                        color: jcbDarkColor,
                        weight: FontWeight.w900,
                      ),
                    ).paddingSymmetric(horizontal: 24),
                    18.height,
                    Text(
                      e.subTitle.validate(),
                      style: primaryTextStyle(
                          color: jcbDarkColor, weight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ).paddingSymmetric(horizontal: 24).expand(),
                    Image.asset(e.image.validate(),
                        width: context.width(),
                        height: context.height() * 0.63,
                        fit: BoxFit.cover),
                  ],
                );
              }).toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: jcbDarkColor,
            width: context.width(),
            height: context.height() * 0.12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Geç', style: boldTextStyle(size: 14, color: Colors.white))
                    .onTap(
                  () {
                    const Anasayfa().launch(context);
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                DotIndicator(
                  pageController: pageController,
                  pages: walkThroughList,
                  unselectedIndicatorColor: Colors.grey.withOpacity(0.5),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  decoration: BoxDecoration(
                      color: jcbSecondaryColor, borderRadius: radius(32)),
                  child: Text(currentPage == 2 ? 'Bitir' : 'İleri',
                      style: boldTextStyle(size: 14, color: Colors.white)),
                ).onTap(() {
                  if (currentPage == 2) {
                    const Anasayfa().launch(context);
                  } else {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 550),
                        curve: Curves.decelerate);
                  }
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
