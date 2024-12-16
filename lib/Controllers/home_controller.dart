import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fw_admin/Model/order_model.dart';
import 'package:fw_admin/Model/product.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescCtrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String category = 'general';
  String brand = 'unbranded';
  String offer = 'false';

  List<Product> products = [];
  List<OrderModel> orderList = [];

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  late CollectionReference orderCollection;

  @override
  void onInit() async {
    productCollection = firebaseFirestore.collection('footwareProduct');
    orderCollection = firebaseFirestore.collection('orders');
    await fetchData();
    // TODO: implement onInit
    super.onInit();
  }

// method to add product
  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
          id: doc.id,
          name: productNameCtrl.text,
          category: category,
          description: productDescCtrl.text,
          price: double.tryParse(productPriceCtrl.text),
          brand: brand,
          image: productImgCtrl.text,
          offer: bool.tryParse(offer));
      final productJson = product.toJson();
// set datA  in firebase document
      doc.set(productJson);
      Get.snackbar('success', 'Product added successfully',
          colorText: Colors.green);
      update();
      fetchData();
      // update ui after changings
      setDefaultValue();
    } catch (e) {
      Get.snackbar('Failed', 'Product added Fal', colorText: Colors.red);
      print(e.toString());
    }
  }

  fetchData() async {
    try {
      print('featch data called');
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrivedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      print('products : $retrivedProducts');
      // now clear the created list to add this data otherwise it will readd
      // products.clear();

      products.assignAll(retrivedProducts);
      update(); // it will work to update ui
      print(products);
    } catch (e) {
      print(e);
    }
  }

  deleteData(String id) async {
    var documentId = productCollection.doc().id;
    await productCollection.doc(id).delete();
    Get.snackbar('success', 'Deleted successfully', colorText: Colors.green);

    fetchData();
  }

  setDefaultValue() {
    productNameCtrl.clear();
    productDescCtrl.clear();
    productImgCtrl.clear();
    productPriceCtrl.clear();

    category = 'general';
    brand = 'unbranded';
    offer = 'false';
    update();
  }

// orders fetch

  fetchOrders() async {
    try {
      print('featch data called');
      QuerySnapshot orderSnapshot = await orderCollection.get();
      final List<OrderModel> retrivedProducts = orderSnapshot.docs
          .map((doc) => OrderModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      print('orders : $retrivedProducts');
      // now clear the created list to add this data otherwise it will readd
      // products.clear();

      orderList.assignAll(retrivedProducts);
      update(); // it will work to update ui
    } catch (e) {
      print(e);
    }
  }

  deleteOrder(String id) async {
    var documentId = orderCollection.doc().id;
    await orderCollection.doc(id).delete();
    Get.snackbar('success', 'Deleted successfully', colorText: Colors.green);

    fetchOrders();
  }
}
