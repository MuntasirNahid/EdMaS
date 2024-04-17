import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final IconData icon;

  const TextFieldInput({
    super.key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 702,
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFF6F6F6F)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 55,
            height: 52,
            decoration: const ShapeDecoration(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.50, color: Color(0xFF6F6F6F)),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
            ),
            child: Center(
              child: Icon(icon),
            ),
          ),
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              contentPadding: const EdgeInsets.all(8),
            ),
            keyboardType: textInputType,
            obscureText: isPass,
          ),
        ],
      ),
    );
  }
}
