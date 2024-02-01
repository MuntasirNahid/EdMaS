import 'package:edmas/presentation/widgets/dashboard/leftside/feature_list.dart';
import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';

class Features extends StatelessWidget {
  const Features({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1193,
      height: 156,
      decoration: ShapeDecoration(
        color: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FeatureList(
              itemName: 'Items list',
              imagePath: 'list.png',
            ),
            FeatureList(
              itemName: 'Request',
              imagePath: 'req.png',
            ),
            FeatureList(
              itemName: 'Approval',
              imagePath: 'approve.png',
            ),
            FeatureList(
              itemName: 'Approve',
              imagePath: 'approve2.png',
            ),
            FeatureList(
              itemName: 'Return',
              imagePath: 'ret.png',
            ),
            FeatureList(
              itemName: 'Damages',
              imagePath: 'dam.png',
            ),
            FeatureList(
              itemName: 'Replace',
              imagePath: 'rep.png',
            ),
            FeatureList(
              itemName: 'Fund',
              imagePath: 'fund.png',
              filter: true,
            ),
          ],
        ),
      ),
    );
  }
}
