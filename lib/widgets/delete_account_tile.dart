import 'package:flutter/material.dart';

import '../provider/expansion_tile_provider.dart';

class DeleteAccountTile extends StatelessWidget {
  final String title;
  const DeleteAccountTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 30),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.red, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: () {
        ExpansionTileProvider.showDeletionConfirmationDialog(context);
      },
    );
  }
}
