import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  String text;
  int index;
  Function onButtonClicked;

  GameButton(
      {super.key,
      required this.text,
      required this.index,
      required this.onButtonClicked});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () {
            onButtonClicked(index);
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          child: Text(
            text,
            style: const TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
