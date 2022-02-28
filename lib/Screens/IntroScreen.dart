import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        showNextButton: false,
        pages: [
          PageViewModel(
            title: 'TEAM ZONE',
            body: 'This is bal abla bal abla bla bla through',
            image: buildImage("lib/assets/images/welcomeScreen2.png"),
          ),
        ],
        done: Text(
          "Next",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onDone: () {},
      ),
    );
  }

  Widget buildImage(String path) => Center(
        child: Image.asset(
          path,
          width: 350,
        ),
      );
  PageDecoration getPageDeco() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
      );
}
