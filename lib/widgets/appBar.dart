import 'package:flutter/material.dart';
import 'package:learning_app/utils/utils.dart';

class LearningAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonEnabled;
  Widget action;

  LearningAppBar({
    super.key,
    required this.title,
    this.isBackButtonEnabled = false,
    this.action = const SizedBox(
      height: 0,
      width: 0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: TextStyle(
            color: Utils.splashColor,
            fontSize: 18,
            fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      leading: isBackButtonEnabled
          ? IconButton(
              onPressed: () {
                Utils.navigatePop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
              ),
            )
          : const SizedBox(),
      actions: [action],
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
