import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:missa/enum/remote_statut.dart';
import 'package:missa/ui/domain_layer/models/user.dart';
import 'package:missa/ui/presenter_layer/repository/auth_repository.dart';

class AuthController extends GetxController {
  AuthRepository authRepository = AuthRepository();
   var remoteStatus = RemoteOperationStatus.none.obs;
  
  Future<String> register({User? user}) async {
    debugPrint("in controller");
    remoteStatus.value = RemoteOperationStatus.loading;
    String result = await authRepository.register(user: user!);
    remoteStatus.value = RemoteOperationStatus.none;
    update(["register"]);
    return result;
  }

 Future<String> login({User? user}) async {
    debugPrint("in controller");
    remoteStatus.value = RemoteOperationStatus.loading;
    String result = await authRepository.login(user: user!);
    remoteStatus.value = RemoteOperationStatus.none;
    update(["login"]);
    return result;
  }

}
