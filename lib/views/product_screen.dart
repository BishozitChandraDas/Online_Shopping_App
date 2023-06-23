import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shopping/controllers/product_controller.dart';

class product_screen extends StatelessWidget {
  final product_controller = Get.put(Product_controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2f232f),
      appBar: AppBar(
        backgroundColor: Color(0xff2f232f),
        centerTitle: true,
        title: Text("All Product List", style: TextStyle(color: Colors.white)),
        actions: [
          Row(
            children: [
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart_checkout_outlined),
                  label: GetX<Product_controller>(
                    builder: (controller) => Text(
                      product_controller.count.toString(),
                    ),
                  ))
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: GetBuilder<Product_controller>(
            builder: (controller) {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 120,
                              width: double.infinity,
                              child: Image.asset(
                                product_controller
                                    .product_data[index].productImage,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product_controller
                                        .product_data[index].productName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      product_controller.add_to_favorite(
                                          product_controller
                                              .product_data[index].id);
                                    },
                                    icon: Icon(
                                      product_controller
                                              .product_data[index].favorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Price : ${product_controller.product_data[index].price} ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      product_controller.add_to_card(
                                          product_controller
                                              .product_data[index]);
                                    },
                                    child: Text(
                                      'Add to Card',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: product_controller.product_data.length);
            },
          )),
          SizedBox(
            height: 10,
          ),
          GetX<Product_controller>(
            builder: (controller) => Text(
              "Total amount: ${product_controller.total_price}",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
