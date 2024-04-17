import 'package:edmas/repositories/auth/auth_repository.dart';

class LoginController {
  final AuthRepository _authRepository = AuthRepository();

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = await _authRepository.loginUser(
      email: email,
      password: password,
    );
    return res;
  }
}
