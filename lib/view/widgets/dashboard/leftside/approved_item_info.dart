import 'package:dio/dio.dart';
import 'package:edmas/global/global.dart';
import 'package:edmas/models/application_model.dart';
import 'package:edmas/utills/colors.dart';
import 'package:edmas/view/screens/bloc/dashboard_bloc.dart';
import 'package:edmas/view/widgets/dashboard/leftside/application_details_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String userRole = "";
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    setState(() {});
    getUserType();
  }

  List<Application> applications = [];

  void getAllApplication() async {
    setState(() {
      isLoading = true;
    });
    Dio dio = await Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString('token')!;

    dio.options.headers['Authorization'] = "Bearer ${token}";
    // dio.options.headers['Content-Type'] = "application/json";

    try {
      var response = await dio.get(fetch_all_application_url);

      //print(response.data['data']);
      for (int i = 0; i < response.data['data'].length; ++i) {
        var data = response.data['data'][i];

        var s = data['quantity'].split(':');
        var quantity = s[2].split('}')[0];

        applications.add(Application(
            id: data['id'],
            applicantId: data['applicantId'],
            applicationToId: data['applicationToId'],
            type: data['type'],
            subject: data['subject'],
            body: data['body'],
            status: data['status'],
            phase: data['phase'],
            quantity: quantity.toString(),
            productName: data['items'][0]['name'],
            productId: data['items'][0]['id'],
            applicantName: data['applicant']['name'],
            applicantEmail: data['applicant']['email'],
            applicationToName: data['applicationTo']['name'],
            applicationToEmail: data['applicationTo']['email'],
            items: []));
        print(applications[i]);
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Something Went Wrong!"),
        backgroundColor: Colors.red,
      ));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: applications.map((application) {
              return ApplicationDetailsWidget(
                widget: widget,
                application: application,
              );
            }).toList(),
          );
  }

  void getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userRole = await prefs.getString('user_role')!;
    setState(() {
      isLoading = false;
    });
    print(userRole);
    if (userRole == "store_manager" || userRole == 'dept_head') {
      getAllApplication();
    }
  }
}

class ApplicationDetailsWidget extends StatelessWidget {
  const ApplicationDetailsWidget(
      {super.key, required this.widget, required this.application});

  final ApprovedItemInfo widget;
  final Application application;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isApproval != null
          ? () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ApplicationDetailsDialogue(
                      application: application,
                    );
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
                  "Status: ${application.phase}",
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
                child: Text(
                  "Product Name: ${application.productName}",
                  style: TextStyle(overflow: TextOverflow.ellipsis),
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
                child: Text("Product Quantity: ${application.quantity}",
                    style: TextStyle(overflow: TextOverflow.ellipsis)),
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
