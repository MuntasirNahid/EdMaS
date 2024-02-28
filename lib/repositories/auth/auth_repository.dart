import 'dart:convert';
import 'dart:io';

import 'package:edmas/global/global.dart';
import 'package:edmas/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class AuthRepository {
  var client = http.Client();

  Future<String> signUpUser({
    required UserModel userModel,
    required String confirmPassword,
    required File dp,
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

      ///edi shob korte hoitese karon postman a raw type na. form-data type.erliga
      var request = http.MultipartRequest('POST', uri);

      request.fields['name'] = userModel.name;
      request.fields['email'] = userModel.email;
      request.fields['role'] = userModel.role;
      request.fields['about'] = userModel.about;
      request.fields['password'] = userModel.password;
      request.fields['confirmPassword'] = confirmPassword;

      // var file = http.MultipartFile.fromBytes(
      //   'dp',
      //   dp,
      //   filename: 'user_dp.${userModel.dpExtension}',
      //   contentType: MediaType('image', userModel.dpExtension),
      // );
      var file = await http.MultipartFile.fromPath(
        'dp',
        dp.path,
        filename: '${userModel.name}_dp.$imageExtension',
        contentType: MediaType('image', imageExtension),
      );
      request.files.add(file);

      //request.files.add(file);

      var response = await request.send();

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
      return 'An Error Occurred and Api call failed, e = ${e.toString()}';
    }
  }
}
