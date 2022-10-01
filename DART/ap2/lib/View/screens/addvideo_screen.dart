import 'package:ap2/constants.dart';
import 'package:flutter/material.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});

  showOptionsDialog(BuildContext context) {
    return showDialog(context: context, builder: (context){

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showOptionsDialog(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(
                color: kButtonColor, borderRadius: BorderRadius.circular(15)),
            child: const Center(
              child: Text(
                'Add Video',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
