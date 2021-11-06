import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitCon extends GetxController {
  var id = ''.obs;

  @override
  void onInit() {
    id.value = GetStorage().read('id');

    super.onInit();
  }

  setid(String code) {
    id(code);
    GetStorage().write('id', code);
  }
}
