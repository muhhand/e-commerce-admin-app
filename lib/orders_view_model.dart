import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_app/product_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'firestore_orderst.dart';
import 'order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class OrdersViewModel extends GetxController {
  int get index => _index;
  int _index = 0;

  String brand, category, description, image,name,price,productid,size,color;

  String colory = '#000000';


  List<OrderModel> _orders = [];

  List<OrderModel> get orders => _orders;

  bool _isLoading = false;

  bool get isLoading => _isLoading;




  GlobalKey<FormState> formState = GlobalKey();






  @override
  void onInit() {
    super.onInit();
    _getCheckoutsFromFireStore();
  }

  _getCheckoutsFromFireStore() async {
    _isLoading = true;
    _orders = [];
    List<QueryDocumentSnapshot> _checkoutsSnapshot =
    await FirestoreCheckout().getOrdersFromFirestore();
    _checkoutsSnapshot.forEach((order) {
      _orders
          .add(OrderModel.fromJson(order.data() as Map<String, dynamic>));
    });
    _isLoading = false;
    update();
  }

  addCheckoutToFireStore() async {
    await FirestoreCheckout().addOrderToFirestore(ProductModel(
      name: name,
      image: image,
      description: description,
      color: colory,
      size: size,
      price: price,
      brand: brand,
      category: category,
      productid: '${FirestoreCheckout().productsCollection.doc().id}',
    ));
  }


}
