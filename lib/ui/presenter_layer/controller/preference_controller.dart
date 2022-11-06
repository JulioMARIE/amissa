import 'package:get/get.dart';
import 'package:missa/ui/presenter_layer/controller/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsController extends GetxController {
  var isAuthenticated = false.obs;

  PrefsController() {
    loadPrefs();
  }

  loadPrefs() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool value = pref.getBool("authenticated") ?? false;
    print("VALES $value");
    if (value) {
      isAuthenticated.value = true;
    }
  }
}
