import 'package:edmas/controllers/products/products_controller.dart';
import 'package:edmas/utills/colors.dart';
import 'package:edmas/view/widgets/dashboard/leftside/dashboard_left_side.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RequestButton extends StatefulWidget {
  final RequestData requestData;
  const RequestButton({
    super.key,
    required this.requestData,
  });

  @override
  State<RequestButton> createState() => _RequestButtonState();
}

class _RequestButtonState extends State<RequestButton> {
  bool isLoading = false;

  Future<String> sendApplication() async {
    setState(() {
      isLoading = true;
    });

    List<Map<String, dynamic>> items = [
      {
        "id": widget.requestData.itemId,
        "quantity": widget.requestData.quantity,
      },
    ];

    final String message = await ProductsController().sendApplication(
      type: widget.requestData.requestType,
      items: items,
      body: widget.requestData.applicationBody,
    );
    setState(() {
      isLoading = false;
    });
    return message;
  }

  @override
  Widget build(BuildContext context) {
    print("Request Application Type: ${widget.requestData.requestType}");
    print("Request Application Body: ${widget.requestData.applicationBody}");
    return GestureDetector(
      onTap: () async {
        final message = await sendApplication();
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 4,
          backgroundColor: primaryColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
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
          child: isLoading
              ? const LinearProgressIndicator()
              : const Text(
                  "Send Request",
                ),
        ),
      ),
    );
  }
}
