import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';

class ApproveRejectButton extends StatelessWidget {
  const ApproveRejectButton({
    super.key,
    this.isApproval,
  });
  final bool? isApproval;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 50,
          decoration: ShapeDecoration(
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 3,
                offset: Offset(1, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: Center(
            child: isApproval != null ? Text("Forward") : Text("Approve"),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          width: 200,
          height: 50,
          decoration: ShapeDecoration(
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 3,
                offset: Offset(1, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: Center(child: Text("Reject")),
        ),
      ],
    );
  }
}
