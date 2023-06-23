import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:online_shopping/model/product_model.dart';

class Product_controller extends GetxController {
  List<product> product_data = [];

  List<product> cart_item = List<product>.empty().obs;

  add_to_card(product item) {
    print("Add to Card");
    cart_item.add(item);
  }

  double get total_price => cart_item.fold(0, (sum, item) => sum + item.price);
  int get count => cart_item.length;

  @override
  void onInit() {
    super.onInit();
    fetchproduct_data();
  }

  fetchproduct_data() async {
    await Future.delayed(Duration(seconds: 2));

    List<product> Server_response = [
      product(
          id: 1,
          productName: "T-Shirt",
          productImage: 'assets/images/T-shirt1.jpg',
          productDescription: 'Some description about product',
          price: 499,
          favorite: false),
      product(
          id: 2,
          productName: "T-Shirt",
          productImage: 'assets/images/T-shirt2.jpg',
          productDescription: 'Some description about product',
          price: 749,
          favorite: false),
      product(
          id: 3,
          productName: "T-Shirt",
          productImage: 'assets/images/T-shirt3.jpg',
          productDescription: 'Some description about product',
          price: 499,
          favorite: false),
      product(
          id: 4,
          productName: "Shirt",
          productImage: 'assets/images/Shirt1.jpg',
          productDescription: 'Some description about product',
          price: 1149,
          favorite: false),
      product(
          id: 5,
          productName: "Shirt",
          productImage: 'assets/images/Shirt2.jpg',
          productDescription: 'Some description about product',
          price: 1499,
          favorite: false),
      product(
          id: 6,
          productName: "Shirt",
          productImage: 'assets/images/Shirt3.jpg',
          productDescription: 'Some description about product',
          price: 1399,
          favorite: false),
      product(
          id: 7,
          productName: "Formal Pant",
          productImage: 'assets/images/Pant1.jpg',
          productDescription: 'Some description about product',
          price: 1790,
          favorite: false),
      product(
          id: 8,
          productName: "Formal Pant",
          productImage: 'assets/images/Pant2.jpg',
          productDescription: 'Some description about product',
          price: 2190,
          favorite: false),
      product(
          id: 9,
          productName: "Formal Pant",
          productImage: 'assets/images/Pant3.jpg',
          productDescription: 'Some description about product',
          price: 2390,
          favorite: false),
    ];

    product_data.assignAll(Server_response);
    print(product_data);
    update();
  }

  add_to_favorite(id) {
    var index = product_data.indexWhere((element) => element.id == id);
    product_data[index].favorite = !product_data[index].favorite;
    update();
  }
}
