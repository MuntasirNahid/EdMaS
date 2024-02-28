import 'package:edmas/view/widgets/dashboard/leftside/dashboard_left_side.dart';
import 'package:edmas/view/widgets/dashboard/rightside/dashboard_right_side.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 40.0, 80.0, 40.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //left side all
            LeftSideAll(),

            const SizedBox(
              width: 15,
            ),

            //Right side all
            RightSideAll(),
          ],
        ),
      ),
    );
  }
}
