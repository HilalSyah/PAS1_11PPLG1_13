import 'package:get/get.dart';

class Bottomnavcntrler extends GetxController {
  var IndexSelect = 0.obs;

  void ChangeIndexMenu(int index) {
    IndexSelect.value = index;
  }
}
