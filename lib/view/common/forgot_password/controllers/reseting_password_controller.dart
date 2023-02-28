import 'package:get/get.dart';

class ResetPassWordController extends GetxController {
  var resetStep = 1.obs;

  @override
  void onInit() {
    resetStep.value = 1;
    super.onInit();
  }
}