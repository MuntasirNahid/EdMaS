import 'dart:typed_data';

import 'package:edmas/controllers/auth/signup_controller.dart';
import 'package:edmas/global/common_widgets/image_picker.dart';
import 'package:edmas/models/user_model.dart';
import 'package:edmas/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? selectedRole;
  String? _imageExtension;

  bool _isLoading = false;
  //
  // PickedFile _image = PickedFile('');
  // File imageFile = File('');
  Uint8List? _image;

  // void selectImage() async {
  //   PickedFile pickedFile = await pickImage(ImageSource.gallery);
  //   setState(() {
  //     _image = pickedFile;
  //     String extension = path.extension(pickedFile.path);
  //     _imageExtension = extension.replaceAll('.', '');
  //   });
  // }
  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  // // Function to convert PickedFile to File
  // File convertPickedFileToFile(PickedFile pickedFile) {
  //   File file = File(pickedFile.path);
  //   return file;
  // }

  void signupUser() async {
    setState(() {
      _isLoading = true;
    });
    final userModel = UserModel(
      name: _usernameController.text,
      email: _emailController.text,
      role: selectedRole!,
      about: _bioController.text,
      password: _passwordController.text,
    );
    //  imageFile = convertPickedFileToFile(_image);

    String res = await SignUpController().signUpUser(
      userModel: userModel,
      confirmPassword: _confirmPasswordController.text,
      dp: _image!,
      imageExtension: 'jpeg',
    );

    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res),
          backgroundColor: Colors.red,
        ),
      );

      //showToast("Something error Occurred.Please Try Again ", Colors.red);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res),
          backgroundColor: Colors.green,
        ),
      );
//      showToast("User Registered Successfully", Colors.green);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width / 4, vertical: 100),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(
                            _image!,
                          ),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                            'https://i.stack.imgur.com/l60Hf.png',
                          ),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: 'Enter your Name',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              DropdownButtonFormField(
                value: selectedRole,
                onChanged: (value) {
                  setState(() {
                    selectedRole = value as String;
                  });
                },
                items: [
                  const DropdownMenuItem(
                    value: 'dept_head',
                    child: Text('Department Head'),
                  ),
                  const DropdownMenuItem(
                    value: 'store_manager',
                    child: Text('Store Manager'),
                  ),
                  const DropdownMenuItem(
                    value: 'teacher',
                    child: Text('Teacher'),
                  ),
                  const DropdownMenuItem(
                    value: 'staff',
                    child: Text('Staff'),
                  ),
                ],
                decoration: const InputDecoration(hintText: 'Select your role'),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: _bioController,
                decoration: const InputDecoration(
                  hintText: 'Enter your about yourself',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  hintText: 'Confirm your password',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: signupUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: Colors.blue,
                  ),
                  child: !_isLoading
                      ? const Text(
                          'Sign up',
                        )
                      : const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      'Already have an account?',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        ' Login.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
