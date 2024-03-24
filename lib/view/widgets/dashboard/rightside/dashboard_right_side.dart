import 'package:edmas/view/widgets/dashboard/rightside/user_details.dart';
import 'package:flutter/material.dart';

class RightSideAll extends StatelessWidget {
  const RightSideAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 145.0),
      child: Container(
        width: 355,
        child: UserDetails(),
      ),
    );
  }
}
