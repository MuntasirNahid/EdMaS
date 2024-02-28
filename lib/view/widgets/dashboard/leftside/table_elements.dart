import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';

class TableElements extends StatelessWidget {
  const TableElements({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      height: 52,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(60, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 150,
              //color: Colors.blueAccent,
              child: Text(
                'ID: 01',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Container(
              width: 500,
              //    color: Colors.blueAccent,
              child: Text(
                'Product 1',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Container(
              width: 150,
              //color: Colors.blueAccent,
              child: Text(
                '08',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Container(
              width: 100,
              // color: Colors.blueAccent,
              child: Image.asset(
                'details.png',
                color: primaryColor,
                alignment: Alignment.centerRight,
              ),
            ),
            const SizedBox(
              width: 50,
            ),
          ],
        ),
      ),
    );
  }
}
