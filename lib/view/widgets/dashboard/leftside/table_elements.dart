import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';

class TableElements extends StatelessWidget {
  final int id;
  final String productName;
  final int quantity;
  final VoidCallback onPressed;
  const TableElements({
    super.key,
    required this.id,
    required this.productName,
    required this.quantity,
    required this.onPressed,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
                  ' $id',
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
                  '$productName',
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
                  '$quantity',
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
      ),
    );
  }
}
