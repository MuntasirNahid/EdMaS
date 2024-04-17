import 'package:edmas/controllers/products/products_controller.dart';
import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';

class Fund_overview extends StatefulWidget {
  const Fund_overview({
    super.key,
  });

  @override
  State<Fund_overview> createState() => _Fund_overviewState();
}

class _Fund_overviewState extends State<Fund_overview> {
  double totalFund = 0.0;
  bool isFundLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    fetchTotalFund();
    super.initState();
  }

  void fetchTotalFund() async {
    totalFund = await ProductsController().getCurrentBalance();
    setState(() {
      isFundLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 240,
          height: 50,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: primaryColor,
            shadows: const [
              BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 3,
                  offset: Offset(1, 1),
                  spreadRadius: 0),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: isFundLoaded
                ? Text(
                    "Total Fund : $totalFund Tk",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                    textAlign: TextAlign.center,
                  )
                : const SizedBox(
                    height: 15,
                    width: 20,
                    child: LinearProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
