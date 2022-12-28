import 'package:app5/dialogs/logout_dialog.dart';
import 'package:flutter/material.dart';

enum MenuAction { logout, deleteAccount }

class MainPopupMenuButton extends StatelessWidget {
  const MainPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuAction>(
      onSelected: (value) async {
        switch (value) {
          case MenuAction.logout:
            final shouldLogOut = showLogOutDialog(context);
            break;
          case MenuAction.deleteAccount:
            // TODO: Handle this case.
            break;
