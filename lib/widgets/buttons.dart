import 'package:flutter/cupertino.dart';

class SimButtons extends StatelessWidget {
  final color;
  final String buttonText;
  final Color textcc;
  final buttontap;

  SimButtons({required this.color, required this.buttonText, required this.textcc, required this.buttontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontap,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500, color: textcc),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
