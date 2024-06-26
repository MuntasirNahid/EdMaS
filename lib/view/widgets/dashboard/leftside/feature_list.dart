import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';

class FeatureList extends StatelessWidget {
  final String itemName;
  final String imagePath;
  final bool filter;
  final VoidCallback onTap;
  const FeatureList({
    super.key,
    required this.itemName,
    required this.imagePath,
    this.filter = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
              image: DecorationImage(
                image: AssetImage(
                  imagePath,
                ),
                colorFilter: filter
                    ? ColorFilter.mode(
                        primaryColor,
                        BlendMode.modulate,
                      )
                    : null,
              ),
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
      ),
    );
  }
}
