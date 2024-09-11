import 'package:get/get.dart';

class HomeController extends GetxController {
  // Reactive state management using RxInt
  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}