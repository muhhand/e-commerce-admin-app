import 'package:ecommerce_admin_app/Add_Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'custom_text.dart';
import 'orders_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'Orders',
                    fontSize: 20,
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GetBuilder<OrdersViewModel>(
              init: Get.put(OrdersViewModel()),
              builder: (controller) => ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: controller.orders[index].date,
                                    color: Colors.grey,
                                  ),
                                  CustomText(
                                    text: 'Confirmed',
                                    color: Colors.red.shade300,
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.shade200,
                              ),
                              CustomText(
                                text: controller.orders[index].name,
                              ),
                              CustomText(
                                text: controller.orders[index].street,
                              ),
                              CustomText(
                                text: controller.orders[index].city,
                              ),
                              CustomText(
                                text: controller.orders[index].country,
                              ),
                              CustomText(
                                text: controller.orders[index].phone,
                              ),
                              CustomText(
                                text: controller.orders[index].productname,

                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.shade200,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Total Billed',
                                    color: primaryColor,
                                  ),
                                  CustomText(
                                    text:
                                    '\$${controller.orders[index].totalPrice}',
                                    color: primaryColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  color: Colors.grey.shade200,
                ),
                itemCount: controller.orders.length,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: IconButton(
        icon: Icon(Icons.add,color: Colors.white,),
          onPressed: (){
          Get.to(AddPage());
          },
      ),
    )
    );
  }
}
