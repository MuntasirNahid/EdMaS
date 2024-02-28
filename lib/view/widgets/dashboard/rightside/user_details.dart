import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 370,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(
                'nahid.jpg',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'noti.png',
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'edit.png',
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 120,
              width: 260,
              child: Material(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    width: 0.4,
                    color: Color(0x3F000000),
                  ),
                ),

                //inner box
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 22, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Name: ',
                          ),
                          const SizedBox(
                            width: 08,
                          ),
                          Text(
                            'Nahid',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 05,
                      ),
                      Row(
                        children: [
                          Text(
                            'Role: ',
                          ),
                          const SizedBox(
                            width: 08,
                          ),
                          Text(
                            'Store Manager',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 05,
                      ),
                      Text(
                        'Dept of CSE',
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
