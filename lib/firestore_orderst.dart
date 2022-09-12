import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_app/product_model.dart';


class FirestoreCheckout {
  final CollectionReference _ordersCollection = FirebaseFirestore.instance
      .collection('Orders');

  final CollectionReference productsCollection = FirebaseFirestore.instance
      .collection('Products');

  Future<List<QueryDocumentSnapshot>> getOrdersFromFirestore() async {
    var _orders =
        await _ordersCollection.orderBy('date', descending: true).get();
    return _orders.docs;
  }


  addOrderToFirestore(ProductModel productModel) async {
    await productsCollection.doc().set(productModel.toJson());
  }
}
