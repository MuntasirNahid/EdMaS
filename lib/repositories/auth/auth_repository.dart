import 'dart:convert';
import 'dart:typed_data';

import 'package:edmas/global/global.dart';
import 'package:edmas/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  var client = http.Client();

  Future<String> signUpUser({
    required UserModel userModel,
    required String confirmPassword,
    required Uint8List dp,
    required String imageExtension,
  }) async {
    try {
      // //api call
      // final response = await client.post(
      //   Uri.parse(register_url),
      //   body: {
      //     'name': userModel.name,
      //     'email': userModel.email,
      //     'role': userModel.role,
      //     'about': userModel.about,
      //     'password': userModel.password,
      //     'dp': userModel.dp,
      //     'confirmPassword': confirmPassword,
      //   },
      // );
      var uri = Uri.parse(register_url);

      ///egula shob korte hoitese karon postman a raw type na. form-data type.
      var request = http.MultipartRequest('POST', uri);

      request.fields['name'] = userModel.name;
      request.fields['email'] = userModel.email;
      request.fields['role'] = userModel.role;

      request.fields['password'] = userModel.password;
      request.fields['confirmPassword'] = confirmPassword;

      var file = http.MultipartFile.fromBytes(
        'dp',
        dp,
        filename: '${userModel.name}_dp.$imageExtension',
        contentType: MediaType('image', imageExtension),
      );

      request.files.add(file);

      //request.files.add(file);

      var response = await request.send();
      // final responseData = await response.stream.bytesToString();
      //
      // final decodeResponse = jsonDecode(responseData);
      // print('printing decode response');
      //
      // print(decodeResponse['data'].toString());
      //
      // final user = UserModel.fromMap(decodeResponse['data']);
      //
      // print(user.name);
      // print(user.id);

      print('{Hello we got status code: ${response.statusCode}}');

      if (response.statusCode == 201) {
        final responseData = await response.stream.bytesToString();
        final decodeResponse = jsonDecode(responseData);
        final user = UserModel.fromMap(decodeResponse['data']);

        print(user.name);
        print(user.id);
        return 'success';
      } else {
        var errorData = await response.stream.bytesToString();
        print('Error Response: $errorData');
        return 'An Error Occurred while registering user';
      }
    } catch (e) {
      print('An Error Occurred and Api call failed, e = ${e.toString()}');
      return 'An Error Occurred and Api call failed, e = ${e.toString()}';
    }
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.post(
        Uri.parse(login_url),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        final responseData = jsonDecode(response.body);
        final user = UserModel.fromMap(responseData['data']);
        prefs.setString('token', jsonDecode(response.body)['token']);

        prefs.setString('user_role', user.role);
        print('User Role: ${user.role}');
        print('Token: ${jsonDecode(response.body)['token']}');
        return 'success';
      } else {
        return 'An Error Occurred while logging in';
      }
    } catch (e) {
      return 'An Error Occurred and Api call failed, e = ${e.toString()}';
    }
  }
}
