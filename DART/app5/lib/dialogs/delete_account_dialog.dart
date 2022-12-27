

import 'package:app5/dialogs/generic_dialog.dart';
import 'package:flutter/cupertino.dart' show BuildContext;

Future<bool> showDeleteAccountDialog(BuildContext context){
  return showGenericDialog(context: context, title: title, content: content, optionsBuilder: optionsBuilder)
}