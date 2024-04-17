import 'package:edmas/utills/colors.dart';
import 'package:edmas/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({
    super.key,
  });

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  bool isUserNameLoaded = false;

  String userName = '';
  String userRole = '';
  @override
  void initState() {
    // TODO: implement initState
    _loadUserName();
    super.initState();
  }

  void _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userName = prefs.getString('user_name')!;
      userRole = prefs.getString('user_role')!;
      isUserNameLoaded = true;
    });
  }

  // Function to handle logout
  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Clear user name from SharedPreferences
    await prefs.remove('user_name');
    await prefs.remove('token');
    await prefs.remove('user_role');

    // Navigate to login screen with no chance of getting back
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return const LoginScreen();
    }), (route) => false);
  }

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
              backgroundImage: NetworkImage(
                'https://i.stack.imgur.com/l60Hf.png',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'edit.png',
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    ///clear shared preference and navigate to login screen with no chance of getting back
                    _logout();
                  },
                  child: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
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
                          const Text(
                            'Name: ',
                          ),
                          const SizedBox(
                            width: 08,
                          ),
                          isUserNameLoaded
                              ? Text(
                                  userName,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              : const SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(),
                                ),
                        ],
                      ),
                      const SizedBox(
                        height: 05,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Role: ',
                          ),
                          const SizedBox(
                            width: 08,
                          ),
                          isUserNameLoaded
                              ? Text(
                                  userRole == 'store_manager'
                                      ? 'Store Manager'
                                      : userRole == 'dept_head'
                                          ? 'Dept Head'
                                          : userRole == 'staff'
                                              ? 'Staff'
                                              : userRole == 'teacher'
                                                  ? 'Teacher'
                                                  : userRole == 'student'
                                                      ? 'Student'
                                                      : 'Unknown',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                  ),
                                )
                              : const SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(),
                                ),
                        ],
                      ),
                      const SizedBox(
                        height: 05,
                      ),
                      const Text(
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
