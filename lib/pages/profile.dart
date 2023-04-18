import 'package:flutter/material.dart';
import 'package:learning_app/model/setting.dart';
import 'package:learning_app/pages/login.dart';
import 'package:learning_app/utils/utils.dart';
import 'package:learning_app/widgets/appBar.dart';
import 'package:learning_app/widgets/bottom_navigation_bar.dart';
import 'package:learning_app/widgets/navigator_button.dart';
import 'package:learning_app/widgets/setting_expansion_tile.dart';

import '../widgets/delete_account_tile.dart';
import '../widgets/profile_pic.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String profilePicLocation = "assets/images/profile pic.png";
    final settingModel = SettingModel();

    return Scaffold(
      appBar: LearningAppBar(title: "MY ACCOUNT"),
      body: ListView(
        children: [
          // Profile Information
          profileInfo(context, profilePicLocation),
          const SizedBox(height: 20),

          // SettingModel Expansion Tiles
          ...settings(settingModel),

          // Delete Account Tile
          const DeleteAccountTile(title: "Delete Account"),

          const SizedBox(height: 15),

          logOutButton(context),

          const SizedBox(height: 50)
        ],
      ),
      bottomNavigationBar: const LearnerBottomNavigationBar(),
    );
  }

  Padding logOutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: NavigatorButton(
          func: () {
            Utils.navigatePushReplaceToPage(context, const LoginPage());
          },
          action: "Log Out"),
    );
  }

  List<Widget> settings(SettingModel setting) {
    // The spread operator (...) is used to insert each widget from the resulting list directly into the
    // ListView children list, instead of adding the list itself directly. This effectively "spreads" the
    // individual widgets into the list.
    return List.generate(setting.settings.length, (index) {
      final settingOptions = setting.settings[index];
      return SettingExpansionTile(
          title: settingOptions.title, children: settingOptions.children);
    });
  }

  Container profileInfo(BuildContext context, String profilePicLocation) {
    return Container(
      height: 200,
      color: Theme.of(context).textSelectionTheme.cursorColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 30),
          ProfilePicture(profilePicLocation: profilePicLocation),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              username(),
              const SizedBox(height: 5),
              userEmail(),
            ],
          )
        ],
      ),
    );
  }

  Text userEmail() {
    return const Text(
      "John@gmail.com",
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text username() {
    return const Text(
      "John Doe",
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
