import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/pages/platform_intro.dart';
import 'package:learning_app/utils/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    moveToPlatformIntroPage();
  }

  void moveToPlatformIntroPage() async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    await Navigator.pushReplacement(context,
        CupertinoPageRoute(builder: (context) => const PlatformIntro()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.splashColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              "Learning App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
