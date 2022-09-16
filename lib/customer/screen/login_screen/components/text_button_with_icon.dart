
import 'package:flutter/material.dart';

class TextButtonWithIcon extends StatelessWidget {
  const TextButtonWithIcon(
      {Key? key,
      this.height,
      this.width,
      required this.label,
      required this.onPress})
      : super(key: key);

  final double? height;
  final double? width;
  final String label;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
          onPressed: () {
            onPress();
          },         
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
          child: Text(
            label,
            style:  TextStyle(
              fontSize: 16.0,
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w500,
            ),
          )),
    );
 
  }
}
