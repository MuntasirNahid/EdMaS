import 'dart:typed_data';

import 'package:edmas/models/user_model.dart';
import 'package:edmas/repositories/auth/auth_repository.dart';

class SignUpController {
  final AuthRepository _authRepository = AuthRepository();

  Future<String> signUpUser({
    required UserModel userModel,
    required String confirmPassword,
    required Uint8List dp,
    required String imageExtension,
  }) async {
    String res = await _authRepository.signUpUser(
      userModel: userModel,
      confirmPassword: confirmPassword,
      dp: dp,
      imageExtension: imageExtension,
    );
    return res;
  }
}
