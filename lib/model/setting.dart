import 'package:flutter/material.dart';

class Setting {
  String title;
  List<Widget> children;

  Setting({required this.title, required this.children});
}

class SettingModel {
  final List<Setting> _settings = [
    Setting(
      title: "Account Settings",
      children: [
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.security),
          title: const Text('Security'),
          onTap: () {},
        ),
      ],
    ),
    Setting(title: "Download Options", children: []),
    Setting(title: "Notifications Setting", children: [
      ListTile(
        leading: const Icon(Icons.notifications),
        title: const Text('Notifications'),
        onTap: () {},
      ),
    ]),
    Setting(title: "Privacy & Policy", children: []),
    Setting(title: "About Us", children: []),
  ];

  // Getter Method
  List<Setting> get settings => _settings;
}
