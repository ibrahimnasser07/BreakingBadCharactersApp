import 'package:flutter/material.dart';

Future<bool> onWillPop(BuildContext context) async {
  bool? exitResult = await showDialog(
    context: context,
    builder: (context) => _buildExitDialog(context),
  );
  return exitResult ?? false;
}

Future<bool?> _showExitDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => _buildExitDialog(context),
  );
}

AlertDialog _buildExitDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Please confirm'),
    content: const Text('Do you want to exit the app?'),
    actions: <Widget>[
      TextButton(
        onPressed: () => Navigator.of(context).pop(false),
        child: const Text('No', style: TextStyle(color: Colors.black)),
      ),
      TextButton(
        onPressed: () => Navigator.of(context).pop(true),
        child: const Text('Yes', style: TextStyle(color: Colors.black)),
      ),
    ],
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    backgroundColor: Colors.yellow,
  );
}
