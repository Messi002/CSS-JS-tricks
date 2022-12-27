import 'package:app5/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart' show BuildContext;

Future<bool> showDeleteAccountDialog(BuildContext context) {
  return showGenericDialog<bool>(
      context: context,
      title: 'Log Out',
      content:
          "Are you sure you want to log out?",
      optionsBuilder: () => {'Cancel' : false,
      'Log Out' : true},).then((value) => value ?? false);
}
