
import 'package:get/get.dart';
import 'package:missa/ui/domain_layer/models/user.dart';

class UserController extends GetxController{
 Rx<User> user = User().obs;
}