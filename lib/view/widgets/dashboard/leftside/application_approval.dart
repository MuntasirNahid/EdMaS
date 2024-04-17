// import 'package:flutter/material.dart';
//
// class ApplicationApproval extends StatelessWidget {
//   const ApplicationApproval({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: 1100,
//         height: 500,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: const [
//             BoxShadow(
//               color: Color(0x3F000000),
//               blurRadius: 3,
//               offset: Offset(1, 1),
//               spreadRadius: 0,
//             )
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text("This is the application...."),
//         ),
//       ),
//     );
//   }
// }

import 'package:edmas/models/application_model_sunny.dart';
import 'package:flutter/material.dart';

class ApplicationApproval extends StatelessWidget {
  final ApplicationModelSunny application;
  const ApplicationApproval({
    super.key,
    required this.application,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 1100,
        height: 500,
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
          child: Text(
            application.body,
            style: TextStyle(overflow: TextOverflow.visible),
          ),
        ),
      ),
    );
  }
}
