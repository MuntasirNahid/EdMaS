import 'package:edmas/controllers/auth/login_controller.dart';
import 'package:edmas/utills/colors.dart';
import 'package:edmas/view/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  bool isLoginHovered = false;
  bool isForgotPassHovered = false;
  bool isSignupHovered = false;

  void login() async {
    setState(() {
      _isLoading = true;
    });
    String res = await LoginController().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (res == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res),
        ),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const DashBoard();
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res),
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width / 4),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'images/login.png',
                width: 378,
                height: 365,
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              Text(
                'Welcome To',
                style: TextStyle(
                  color: Color(0xFF6AB889),
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'SUST CSE STORE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: 484,
                height: 300,
                decoration: ShapeDecoration(
                  color: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(2, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: 433,
                        height: 52,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0xFF6F6F6F)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 85,
                              height: 52,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0.70, color: Color(0xFF6F6F6F)),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                              ),
                              child: Center(
                                child:
                                    SvgPicture.asset('assets/images/email.svg'),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your email',
                                  focusColor: primaryColor,
                                  hintStyle: TextStyle(
                                    color: Color(0xFF5E5E5E),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0.50,
                                      color: Color(0xFF6F6F6F),
                                    ),
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                // obscureText: isPass,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        width: 433,
                        height: 52,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0xFF6F6F6F)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 85,
                              height: 52,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0.70, color: Color(0xFF6F6F6F)),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                              ),
                              child: Center(
                                child:
                                    SvgPicture.asset('assets/images/lock.svg'),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your password',
                                  focusColor: primaryColor,
                                  hintStyle: TextStyle(
                                    color: Color(0xFF5E5E5E),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 0.50,
                                      color: Color(0xFF6F6F6F),
                                    ),
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                obscureText: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      MouseRegion(
                        onEnter: (_) => setState(() {
                          isLoginHovered = true;
                        }),
                        onExit: (_) => setState(() {
                          isLoginHovered = false;
                        }),
                        child: InkWell(
                          onTap: login,
                          child: Center(
                            child: Container(
                              width: 169,
                              height: 42,
                              decoration: ShapeDecoration(
                                color: isLoginHovered
                                    ? Colors.grey.shade400
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0.50, color: Color(0xFF6F6F6F)),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: _isLoading
                                    ? CircularProgressIndicator()
                                    : Text(
                                        'Log in',
                                        style: TextStyle(
                                          color: Color(0xFF6F6F6F),
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Flexible(
              //   flex: 1,
              //   child: Container(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
