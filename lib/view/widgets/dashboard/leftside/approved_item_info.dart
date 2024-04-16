import 'package:edmas/utills/colors.dart';
import 'package:edmas/view/screens/bloc/dashboard_bloc.dart';
import 'package:edmas/view/widgets/dashboard/leftside/application_details_dialogue.dart';
import 'package:flutter/material.dart';

class ApprovedItemInfo extends StatefulWidget {
  const ApprovedItemInfo({
    super.key,
    this.isApproved,
    this.isReturn,
    this.isDamages,
    this.isReplacement,
    this.isApproval,
  });
  final bool? isApproved;
  final bool? isReturn;
  final bool? isDamages;
  final bool? isReplacement;
  final bool? isApproval;

  @override
  State<ApprovedItemInfo> createState() => _ApprovedItemInfoState();
}

class _ApprovedItemInfoState extends State<ApprovedItemInfo> {
  final DashboardBloc dashboardBloc = DashboardBloc();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isApproval != null
          ? () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const ApplicationDetailsDialogue();
                  });
            }
          : () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 3,
                offset: Offset(1, 1),
                spreadRadius: 0,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 180,
              height: 50,
              decoration: ShapeDecoration(
                color: Colors.white,
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
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 13,
                  horizontal: 20,
                ),
                child: Text(
                  "Date: 31/12/2023",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
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
              height: 50,
              width: 240,
              child: Center(
                child: Text("Product Name: 8 Gb RAM"),
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
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
              height: 50,
              width: 240,
              child: Center(
                child: Text("Product Quantity: 8 "),
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                color: widget.isApproved != null
                    ? primaryColor
                    : (widget.isReturn != null
                        ? Color(0xFFFFB800)
                        : (widget.isDamages != null
                            ? Color(0xFFFF0000)
                            : (widget.isReplacement != null
                                ? Color(0xFFFFB800)
                                : (widget.isApproval != null
                                    ? Colors.blueAccent
                                    : primaryColor)))),
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
              height: 50,
              width: 200,
              child: Center(
                child: widget.isApproved != null
                    ? Text("Approved")
                    : (widget.isReturn != null
                        ? Text("Return")
                        : (widget.isDamages != null
                            ? Text("Damages")
                            : (widget.isReplacement != null
                                ? Text("Replacement")
                                : (widget.isApproval != null
                                    ? Text("Details")
                                    : Text(""))))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
