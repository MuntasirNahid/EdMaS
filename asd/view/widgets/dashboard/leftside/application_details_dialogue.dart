import 'package:edmas/view/widgets/dashboard/leftside/application_approval.dart';
import 'package:edmas/view/widgets/dashboard/leftside/approval_item_info.dart';
import 'package:edmas/view/widgets/dashboard/leftside/approve_reject_button.dart';
import 'package:flutter/material.dart';

class ApplicationDetailsDialogue extends StatelessWidget {
  const ApplicationDetailsDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      backgroundColor: Colors.white,
      child: Container(
        height: 700,
        width: 1150,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ApprovalItemInfo(),
              const SizedBox(
                height: 10,
              ),
              ApplicationApproval(),
              const SizedBox(
                height: 15,
              ),
              ApproveRejectButton(
                isApproval: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
