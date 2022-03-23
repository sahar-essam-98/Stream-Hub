import 'package:get/get.dart';

class GeneralDataController extends GetxController{
  RxString interest ="".obs;
  RxInt gender = 0.obs;
  RxString date = "".obs;


  // static GeneralDataController _controller = GeneralDataController();

  static GeneralDataController get to => Get.find<GeneralDataController>();

}