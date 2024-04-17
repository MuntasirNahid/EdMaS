import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';

class TransactionElements extends StatelessWidget {
  final String type;
  final String details;
  final int amount;

  const TransactionElements({
    super.key,
    required this.type,
    required this.details,
    required this.amount,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      height: 52,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
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
                ' $type',
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
                '$details',
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
                '$amount',
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
