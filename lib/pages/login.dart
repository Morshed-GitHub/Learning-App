import 'package:flutter/material.dart';
import 'package:learning_app/widgets/appBar.dart';
import 'package:learning_app/widgets/navigator_button.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../provider/choice_chip_provider.dart';
import '../utils/utils.dart';
import '../widgets/input_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: LearningAppBar(title: "LOG IN", isBackButtonEnabled: true),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          learningAppText(),
          const SizedBox(height: 25),
          askForCredentialText(),
          const SizedBox(height: 20),
          socialMediaLoginOptions(),
          const SizedBox(height: 20),

          // Email
          InputTextWidget(
            controller: emailController,
            hint: "Email",
            func: () {},
          ),

          // Password
          InputTextWidget(
            controller: passwordController,
            hint: "Password",
            showVisibility: true,
            func: () {
              authProvider.togglePasswordVisibility();
            },
            isPassword: true,
          ),
          const SizedBox(height: 5),

          // Remember Me? + Forget password?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const RememberMeCheckBox(),
              ActionTextButton(title: "Forget password?", color: Colors.red)
            ],
          ),
          const SizedBox(height: 15),

          // Log In Button
          NavigatorButton(
            isLoading: authProvider.isLoading,
            func: () {
              authProvider.login(context, emailController.text.toLowerCase(),
                  passwordController.text.toLowerCase());
            },
            action: "Log in with your account",
          ),
          const SizedBox(height: 60),

          // Don't have an Account + Create Account
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              accountQuery(context, title: "Don't have an Account?"),
              ActionTextButton(title: "Create account")
            ],
          )
        ],
      ),
    );
  }

  Text accountQuery(BuildContext context, {String? title}) {
    return Text(
      "$title ",
      style: TextStyle(
        color: Theme.of(context).textSelectionTheme.cursorColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Row socialMediaLoginOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        SocialMediaLoginButton(
            color: Colors.blue,
            icon: Icons.facebook_outlined,
            title: "Facebook"),
        SocialMediaLoginButton(
            color: Colors.red, icon: Icons.snapchat, title: "Snapchat"),
      ],
    );
  }

  Text askForCredentialText() {
    return Text(
      "Enter your log in details to access your acocunt",
      style: TextStyle(
          color: Utils.splashColor, fontSize: 25, fontWeight: FontWeight.w500),
      textAlign: TextAlign.center,
    );
  }

  Widget learningAppText() {
    return Center(
      child: Text(
        "Learning App",
        style: TextStyle(
          color: Utils.splashColor,
          fontSize: 35,
        ),
      ),
    );
  }
}

class ActionTextButton extends StatelessWidget {
  ActionTextButton({
    super.key,
    required this.title,
    this.color = Colors.blue,
  });

  final String title;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: 8.0), // Align passwordInput & Forget Password
      child: GestureDetector(
        onTap: () {
          Utils.showDevelopmentRunningMessage(context);
        },
        child: Text(
          title,
          style: TextStyle(color: color, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class SocialMediaLoginButton extends StatelessWidget {
  const SocialMediaLoginButton({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
  });

  final Color color;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utils.showDevelopmentRunningMessage(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class RememberMeCheckBox extends StatelessWidget {
  const RememberMeCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ChoiceChipProvider>(
      builder: (context, provider, child) => Expanded(
        child: CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Remember Me?',
            style: TextStyle(
                color: Utils.splashColor, fontWeight: FontWeight.w500),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          value: provider.isRememberMeChecked,
          activeColor: Utils.splashColor,
          checkColor: Colors.white,
          onChanged: (value) {
            provider.toggleRememberMeCheckBoxSelection(value);
          },
        ),
      ),
    );
  }
}
