import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  var userName = "".obs;

  void saveUserData(String name){
    userName.value = name;
    //html.window.localStorage['key'] = name;
    //html.window.document.cookie= "username=${name}; expires=Thu, 18 Dec 2020 12:00:00 UTC";
    //html.window.sessionStorage['session_value'] = name;
    final box = GetStorage();
    box.write('isLogin', true);
    print("isLogin : ${box.read('isLogin')}");
  }

  bool checkIslogin(){
    if (userName.value.isEmpty || userName.value == ""){
      return false;
    }else {
      return true;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

}