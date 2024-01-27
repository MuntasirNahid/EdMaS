import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemList extends StatelessWidget {
  final String itemName;
  final String imagePath;
  const ItemList({
    super.key,
    required this.itemName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: SvgPicture.asset(
            imagePath,
            height: 40,
            width: 40,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          itemName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
            height: 0,
          ),
        )
      ],
    );
  }
}
