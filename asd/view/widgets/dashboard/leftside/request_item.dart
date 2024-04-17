import 'package:flutter/material.dart';

class RequestItem extends StatefulWidget {
  const RequestItem({super.key});

  @override
  State<RequestItem> createState() => _RequestItemState();
}

class _RequestItemState extends State<RequestItem> {
  String _dropDownType = "type";
  String _dropDownProcut = "select";

  void dropDownCallback(String? newValue) {
    setState(() {
      _dropDownType = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
            child: DropdownButton(
              underline: Container(),
              items: const [
                DropdownMenuItem(
                  value: "type",
                  child: Text("Request Type"),
                ),
                DropdownMenuItem(
                  value: "approval",
                  child: Text("Approval"),
                ),
                DropdownMenuItem(
                  value: "return",
                  child: Text("Return"),
                ),
              ],
              onChanged: dropDownCallback,
              value: _dropDownType,
              isExpanded: false,
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
            child: DropdownButton(
              underline: Container(),
              items: const [
                DropdownMenuItem(
                  value: "select",
                  child: Text("Select Product"),
                ),
                DropdownMenuItem(
                  value: "RAM8",
                  child: Text("8 Gb RAM"),
                ),
                DropdownMenuItem(
                  value: "RAM2",
                  child: Text("2 Gb RAM"),
                ),
                DropdownMenuItem(
                  value: "RAM4",
                  child: Text("4 Gb RAM"),
                ),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _dropDownProcut = newValue!;
                });
              },
              value: _dropDownProcut,
              isExpanded: false,
            ),
          ),
        ),
        Container(
          height: 50,
          width: 240,
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
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Quantity",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
