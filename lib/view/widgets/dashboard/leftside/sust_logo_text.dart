import 'package:flutter/material.dart';

class SustLogoAndText extends StatelessWidget {
  const SustLogoAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SvgPicture.asset(
        //   'assets/images/search_icon.svg',
        //   width: 135,
        //   height: 135,
        // ),
        Container(
          height: 136,
          width: 136,
          child: Material(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image(
              image: AssetImage('assets/images/sust.png'),
              width: 135,
              height: 135,
              // fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          width: 05,
        ),
        const Text(
          'CSE STORE MANAGEMENT SYSTEM',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
