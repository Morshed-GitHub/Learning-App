import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/expansion_tile_provider.dart';

class SettingExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool isRemovingButton;

  const SettingExpansionTile({
    super.key,
    required this.title,
    required this.children,
    this.isRemovingButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final expansionTileProvider =
        Provider.of<ExpansionTileProvider>(context, listen: false);

    return ExpansionTile(
      trailing: isRemovingButton
          ? const SizedBox()
          : Consumer<ExpansionTileProvider>(
              builder: (context, value, child) {
                // In order to rotate ">" to this "v"
                return Transform.rotate(
                  angle:
                      (value.setting == title && value.expanded) ? pi / 2 : 0,
                  child: const Icon(Icons.arrow_forward_ios),
                );
              },
            ),
      onExpansionChanged: (value) => expansionTileProvider.updatedExpansionStatus(
          value: value,
          setting:
              title), // setting: settingTitle -> For changing collapsing icon only for the active setting
      title: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: isRemovingButton
                  ? Colors.red
                  : Theme.of(context).expansionTileTheme.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
      children: children,
    );
  }
}
