import 'package:get/get.dart';
import 'package:technical_indicatos/Controllers/TechControllers.dart';

class InititlaBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TechController());
  }
}
