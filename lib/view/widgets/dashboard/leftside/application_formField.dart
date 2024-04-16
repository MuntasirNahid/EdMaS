import 'package:edmas/view/widgets/dashboard/leftside/dashboard_left_side.dart';
import 'package:flutter/material.dart';

class ApplicationFormField extends StatefulWidget {
  final RequestData requestData;
  ApplicationFormField({
    super.key,
    required this.requestData,
  });

  @override
  State<ApplicationFormField> createState() => _ApplicationFormFieldState();
}

class _ApplicationFormFieldState extends State<ApplicationFormField> {
  final TextEditingController requestBodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 1200,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 3,
              offset: Offset(1, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            onChanged: (value) {
              widget.requestData.applicationBody = value.toString();
            },
            maxLines: null,
            controller: requestBodyController,
            decoration: const InputDecoration(
              hintText: "Write your request here",
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.multiline,
            cursorWidth: 2,
            cursorColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}
