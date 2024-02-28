import 'package:edmas/view/widgets/dashboard/rightside/message_overview.dart';
import 'package:edmas/view/widgets/dashboard/rightside/messages.dart';
import 'package:edmas/view/widgets/dashboard/rightside/user_details.dart';
import 'package:flutter/material.dart';

class RightSideAll extends StatelessWidget {
  const RightSideAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      child: Column(
        children: [
          UserDetails(),

          const SizedBox(
            height: 60,
          ),

          //Message Box
          MessageOverview(),
          const SizedBox(
            height: 15,
          ),
          Messages(),
          const SizedBox(
            height: 10,
          ),

          //arekta message
          Container(
            height: 100,
            width: double.infinity,
            child: Material(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 9, 9),
                child: Text(
                  'loren ipsum',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
