
import 'package:get/get.dart';


import 'orders_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => OrdersViewModel());

  }

}