import 'package:flutter/material.dart';

class TransactionTitle extends StatelessWidget {
  const TransactionTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 100,
        ),
        Text(
          'Type',
          style: TextStyle(
            color: Color(0xFF464646),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          width: 400,
        ),
        Text(
          'Details',
          style: TextStyle(
            color: Color(0xFF464646),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          width: 295,
        ),
        Text(
          'Amount',
          style: TextStyle(
            color: Color(0xFF464646),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          width: 140,
        ),
        Text(
          'More',
          style: TextStyle(
            color: Color(0xFF464646),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
