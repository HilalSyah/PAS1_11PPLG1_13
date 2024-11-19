import 'package:get/get.dart';
import 'package:pas/Controllers/BottomNavCntrler.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Bottomnavcntrler>(() => Bottomnavcntrler());
  }
}
