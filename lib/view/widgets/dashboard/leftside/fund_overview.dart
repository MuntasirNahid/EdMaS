import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';

class Fund_overview extends StatelessWidget {
  const Fund_overview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 240,
          height: 50,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: primaryColor,
            shadows: const [
              BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 3,
                  offset: Offset(1, 1),
                  spreadRadius: 0),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              "Total Fund : 10000Tk",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
