import 'package:flutter/material.dart';

class TableTitle extends StatelessWidget {
  const TableTitle({
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
          'Product ID',
          style: TextStyle(
            color: Color(0xFF464646),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          width: 300,
        ),
        Text(
          'Product Name',
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
          'Quantity',
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
          'Details',
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
