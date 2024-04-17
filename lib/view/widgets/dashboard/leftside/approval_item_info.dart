// import 'package:flutter/material.dart';
//
// class ApprovalItemInfo extends StatefulWidget {
//   const ApprovalItemInfo({super.key});
//
//   @override
//   State<ApprovalItemInfo> createState() => _ApprovalItemInfoState();
// }
//
// class _ApprovalItemInfoState extends State<ApprovalItemInfo> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Container(
//           width: 180,
//           height: 50,
//           decoration: ShapeDecoration(
//             color: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             shadows: const [
//               BoxShadow(
//                 color: Color(0x3F000000),
//                 blurRadius: 3,
//                 offset: Offset(1, 1),
//                 spreadRadius: 0,
//               )
//             ],
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//               vertical: 13,
//               horizontal: 20,
//             ),
//             child: Text(
//               "Date: 31/12/2023",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 16,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//         Container(
//           decoration: ShapeDecoration(
//             color: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             shadows: const [
//               BoxShadow(
//                 color: Color(0x3F000000),
//                 blurRadius: 3,
//                 offset: Offset(1, 1),
//                 spreadRadius: 0,
//               )
//             ],
//           ),
//           height: 50,
//           width: 240,
//           child: Center(
//             child: Text("Product Name: 8 Gb RAM"),
//           ),
//         ),
//         Container(
//           decoration: ShapeDecoration(
//             color: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             shadows: const [
//               BoxShadow(
//                 color: Color(0x3F000000),
//                 blurRadius: 3,
//                 offset: Offset(1, 1),
//                 spreadRadius: 0,
//               )
//             ],
//           ),
//           height: 50,
//           width: 240,
//           child: Center(
//             child: Text("Product Quantity: 8 "),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

class ApprovalItemInfo extends StatefulWidget {
  const ApprovalItemInfo(
      {super.key,
      required this.status,
      required this.name,
      required this.quantity});
  final String status;
  final String name;
  final String quantity;

  @override
  State<ApprovalItemInfo> createState() => _ApprovalItemInfoState();
}

class _ApprovalItemInfoState extends State<ApprovalItemInfo> {
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
              "Status: ${widget.status}",
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
            child: Text("Product Name: ${widget.name}"),
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
            child: Text("Product Quantity: ${widget.quantity}"),
          ),
        ),
      ],
    );
  }
}
