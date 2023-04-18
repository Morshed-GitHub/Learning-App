import 'package:flutter/material.dart';
import 'package:learning_app/pages/login.dart';
import 'package:learning_app/utils/utils.dart';
import '../widgets/navigator_button.dart';

class PlatformIntro extends StatelessWidget {
  const PlatformIntro({super.key});

  @override
  Widget build(BuildContext context) {
    String intro =
        "Introduction to Online Learning introduces first-time distance learners to the realities of Web-based education and serves as the most comprehensive, practical guide to achieving success.";

    void moveToLoginPage() {
      Utils.navigatePushToPage(context, const LoginPage());
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset("assets/images/intro.jpeg"),
            ),
            onlinePlatformText(),
            const SizedBox(height: 15),
            platformIntro(intro),
            const SizedBox(height: 30),
            NavigatorButton(
              action: "Start Learning",
              func: moveToLoginPage,
            ),
          ],
        ),
      ),
    );
  }

  Padding platformIntro(String intro) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        intro,
        style:
            const TextStyle(color: Colors.black38, fontSize: 18, height: 1.7),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Text onlinePlatformText() {
    return Text(
      "Online Learning Platform",
      style: TextStyle(
        color: Utils.splashColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
