import 'package:avyaas/features/presentation/login/login_page.dart';
import 'package:avyaas/features/theme/AvyaasAppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'model/OnBoardModel.dart';

class OnboardScreen extends StatefulWidget {
  OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  List<OnBoardModel> allinonboardlist = [
    OnBoardModel(
        "assets/svg/ic_onboarding1.svg",
        "A smart way to grasp the knowledge of Basic Scinece course",
        "Welcome to Name Online"),
    OnBoardModel(
        "assets/svg/ic_onboarding2.svg",
        "We provide the best entrance preperation materials that are review and peered by top professional weekly",
        "Multiple Choice Based"),
    OnBoardModel(
        "assets/svg/ic_onboarding3.svg",
        "Review your performance and be competitve with your peers in our community",
        "Join Our Community"),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemCount: allinonboardlist.length,
                  itemBuilder: (context, index) {
                    return PageBuilderWidget(
                        title: allinonboardlist[index].titlestr,
                        description: allinonboardlist[index].description,
                        imgurl: allinonboardlist[index].imgStr);
                  }),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                            AvyaasApptheme.spashflatbuttoncolor),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Skip",
                        style: AvyaasApptheme.title,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        allinonboardlist.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    currentIndex < allinonboardlist.length - 1
                        ? TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  AvyaasApptheme.spashflatbuttoncolor),
                            ),
                            onPressed: () => _goToNext(),
                            child: Text(
                              "Next",
                              style: AvyaasApptheme.title,
                            ),
                          )
                        : TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  AvyaasApptheme.spashflatbuttoncolor),
                            ),
                            onPressed: () => {_goToLoginPage()},
                            child: Text(
                              "Done",
                              style: AvyaasApptheme.title,
                            ),
                          )
                  ]),
            ),

            // currentIndex < allinonboardlist.length - 1
          ],
        ),
      ),
    );
  }

  _goToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  _goToPrevious() {
    _pageController.previousPage(
        curve: Curves.linear, duration: Duration(milliseconds: 200));
  }

  _goToNext() {
    _pageController.nextPage(
        curve: Curves.linear, duration: Duration(milliseconds: 200));
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index
            ? AvyaasApptheme.black
            : AvyaasApptheme.textGrayLight,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;
  String imgurl;
  PageBuilderWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.imgurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            margin: const EdgeInsets.only(top: 25),
            child: SvgPicture.asset(imgurl),
          ),
          const SizedBox(
            height: 25,
          ),
          //Tite Text
          Text(title, style: AvyaasApptheme.title),
          const SizedBox(
            height: 20,
          ),
          //discription
          Text(description,
              textAlign: TextAlign.center, style: AvyaasApptheme.subtitle)
        ],
      ),
    );
  }
}
