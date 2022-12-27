import 'package:flutter/material.dart';

enum MenuAction { logout, deleteAccount }

class MainPopupMenuButton extends StatelessWidget {
  const MainPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuAction>(
      onSelected: (value) {
        switch (value){
          
          case MenuAction.logout:
            // TODO: Handle this case.
            break;
          case MenuAction.deleteAccount:
            // TODO: Handle this case.
            break;
        }
      },
      itemBuilder: (BuildContext context) {
        return [
         const PopupMenuItem<MenuAction>(
            value: MenuAction.logout,
            child: Text('Log Out'),),
          const PopupMenuItem<MenuAction>(
            value: MenuAction.deleteAccount,
            child: Text('Delete Account'),),
        ];
      },
    );
  }
}
