import 'package:dio/dio.dart';
import 'package:edmas/global/global.dart';
import 'package:edmas/models/application_model.dart';
import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApproveRejectButton extends StatefulWidget {
  final Application application;
  const ApproveRejectButton(
      {super.key, this.isApproval, required this.application});
  final bool? isApproval;

  @override
  State<ApproveRejectButton> createState() => _ApproveRejectButtonState();
}

class _ApproveRejectButtonState extends State<ApproveRejectButton> {
  String userRole = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserType();
  }

  void getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userRole = await prefs.getString('user_role')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            _approveOrForward();
          },
          child: Container(
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
              child: userRole == 'store_manager'
                  ? Text("Forward")
                  : Text("Approve"),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            rejectApplicaiton();
          },
          child: Container(
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
        ),
      ],
    );
  }

  void rejectApplicaiton() async {
    getUserType();
    if (userRole == "store_manager") {
      Dio dio = Dio();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = await prefs.getString('token')!;
      dio.options.headers['Authorization'] = "Bearer ${token}";
      try {
        await dio.patch(
            update_application_status + "/" + "${widget.application.id}",
            data: {
              "subject": widget.application.subject,
              "phase": "sent_to_store_manager"
            });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Status is pending by store manager"),
          backgroundColor: Colors.green,
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Something Went Wrong!"),
          backgroundColor: Colors.red,
        ));
        print(e.toString());
      }
    }
    if (userRole == "dept_head") {
      Dio dio = Dio();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = await prefs.getString('token')!;
      dio.options.headers['Authorization'] = "Bearer ${token}";
      try {
        await dio.patch(
            update_application_status + "/" + "${widget.application.id}",
            data: {
              "subject": widget.application.subject,
              "phase": "sent_to_store_manager"
            });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Rejected by dept head"),
          backgroundColor: Colors.green,
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Something Went Wrong!"),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  void _approveOrForward() async {
    getUserType();
    if (userRole == "store_manager") {
      Dio dio = Dio();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = await prefs.getString('token')!;
      dio.options.headers['Authorization'] = "Bearer ${token}";
      try {
        await dio.patch(
            update_application_status + "/" + "${widget.application.id}",
            data: {
              "subject": widget.application.subject,
              "phase": "approved_by_store_manager"
            });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Forwarded to dept head"),
          backgroundColor: Colors.green,
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Something Went Wrong!"),
          backgroundColor: Colors.red,
        ));
      }
    }
    if (userRole == "dept_head") {
      Dio dio = Dio();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = await prefs.getString('token')!;
      dio.options.headers['Authorization'] = "Bearer ${token}";
      try {
        await dio.patch(
            update_application_status + "/" + "${widget.application.id}",
            data: {
              "subject": widget.application.subject,
              "phase": "approved_by_head"
            });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Forwarded to dept head"),
          backgroundColor: Colors.green,
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Something Went Wrong!"),
          backgroundColor: Colors.red,
        ));
      }
    }
  }
}
