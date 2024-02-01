import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Material(
        color: primaryColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 9, 9),
          child: Text(
            'Johir sir apnare room a dakche. taratari ashen nahole cakri not.QUIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIICCKKKKKKK',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
    );
  }
}
