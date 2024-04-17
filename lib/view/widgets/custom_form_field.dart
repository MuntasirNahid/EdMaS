import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 433,
      height: 52,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFF6F6F6F)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 85,
            height: 52,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.70, color: Color(0xFF6F6F6F)),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
            ),
            child: Center(
                //child: SvgPicture.asset('assets/images/lock.svg'),
                child: Icon(
              icon,
            )),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                focusColor: primaryColor,
                hintStyle: const TextStyle(
                  color: Color(0xFF5E5E5E),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.50,
                    color: Color(0xFF6F6F6F),
                  ),
                  borderRadius: BorderRadius.zero,
                ),
              ),
              // keyboardType: TextInputType.emailAddress,
              // obscureText: true,
            ),
          ),
        ],
      ),
    );
  }
}
