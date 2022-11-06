import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response;
import 'package:missa/ui/domain_layer/models/user.dart';
import 'package:missa/ui/presenter_layer/controller/user_controller.dart';
import 'package:missa/ui/presenter_layer/repository/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final DioClient dioClient = DioClient();
  final UserController _userController = Get.put(UserController());
  Future<String> register({required User user}) async {
    try {
      Response response = await dioClient.dio!
          .post("/api/auth/local/register", data: {
                  "email":user.email,
                  "username": user.username,
                  "numeromomo":user.numeromomo,
                  "password": user.password
                });
      if (response.statusCode! == 200) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
         print("RESULT ${response.data}");

        prefs.setString("token", response.data["jwt"]);
        prefs.setBool("authenticated", true);

        User user = User.fromJson(response.data["user"]);
        _userController.user.value = user;
        debugPrint("USER AUTH ${_userController.user.value.toString()}");

        return "succes";
      }else{
        return "error";
      }
    } on DioError catch (e) {
        debugPrint("${e.response}");
       return "error";
    }
  }

    Future<String> login({required User user}) async {
    try {
      Response response = await dioClient.dio!
          .post("/api/auth/local", data: {
                  "identifier" : user.username,
                  "password": user.password
                });
      if (response.statusCode! == 200) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
         print("RESULT ${response.data}");

       await prefs.setBool("authenticated", true);
         User user = User.fromJson(response.data["user"]);
        _userController.user.value = user ;
        debugPrint("USER AUTH ${_userController.user.value.toString()}");
        return "succes";
      }else{
        return "error";
      }
    } on DioError catch (e) {
        print("${e.response}");
       return "error";
    }
  }
}
