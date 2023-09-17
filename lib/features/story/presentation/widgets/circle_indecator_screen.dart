import 'package:flutter/material.dart';

class CircleIndicatorScreen extends StatelessWidget {
  final bool isWhite;
  const CircleIndicatorScreen({Key? key, this.isWhite = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: isWhite ? Colors.white : Colors.black.withOpacity(0.3),
        ),
        const CircularProgressIndicator()
      ],
    );
  }
}
