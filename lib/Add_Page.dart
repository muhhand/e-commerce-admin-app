import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';
import 'custom_text.dart';
import 'custom_text_form_field.dart';
import 'orders_view_model.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: GetBuilder<OrdersViewModel>(
          init: OrdersViewModel(),
          builder:(controller) =>Form(
            key: controller.formState,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                    CustomTextFormField(
                      onChange:  (value){
                        controller.name = value;
                      },
                      onSave: (value){
                        controller.name = value;
                      },
                      validator: (String value){
                        if(value.isEmpty){
                          return 'Please enter your product name';
                        }
                      },
                      text: 'Name',
                      hint: 'Name',
                    ),
                    SizedBox(height: 20,),
                    CustomTextFormField(
                      onChange:  (value){
                        controller.category = value;
                      },
                      onSave: (value){
                        controller.category = value;
                      },
                      validator: (String value){
                        if(value.isEmpty){
                          return 'Please enter your product category';
                        }
                      },
                      text: 'Category',
                      hint: 'Category',
                    ),
                    SizedBox(height: 20,),
                    CustomTextFormField(
                      onChange:  (value){
                        controller.price = value;
                      },
                      type: TextInputType.number,
                      onSave: (value){
                        controller.price = value;
                      },
                      validator: (String value){
                        if(value.isEmpty){
                          return 'Please enter your price';
                        }
                      },
                      text: 'Price',
                      hint: 'Price',
                    ),
                    SizedBox(height: 20,),
                    CustomTextFormField(
                      onChange:  (value){
                        controller.description = value;
                      },
                      onSave: (value){
                        controller.description = value;
                      },
                      validator: (String value){
                        if(value.isEmpty){
                          return 'Please enter your description';
                        }
                      },
                      text: 'Description',
                      hint: 'Description',
                    ),
                    SizedBox(height: 20,),
                    CustomTextFormField(
                      onChange:  (value){
                        controller.size = value;
                      },
                      onSave: (value){
                        controller.size = value;
                      },
                      validator: (String value){
                        if(value.isEmpty){
                          return 'Please enter your size';
                        }
                      },
                      text: 'Size',
                      hint: 'Size',
                    ),
                    SizedBox(height: 20,),
                    CustomTextFormField(
                      onChange:  (value){
                        controller.image = value;
                      },
                      onSave: (value){
                        controller.image = value;
                      },
                      validator: (String value){
                        if(value.isEmpty){
                          return 'Please enter your image link';
                        }
                      },
                      text: 'Image',
                      hint: 'Image',
                    ),
                    SizedBox(height: 20,),
                    CustomTextFormField(
                      onChange:  (value){
                        controller.brand = value;
                      },
                      onSave: (value){
                        controller.brand = value;
                      },
                      validator: (String value){
                        if(value.isEmpty){
                          return 'Please enter your brand';
                        }
                      },
                      text: 'Brand',
                      hint: 'Brand',
                    ),
                     Container(
                      height: 80,
                      padding: EdgeInsets.all(20),
                      child: MaterialButton(onPressed: () async {
                        controller.addCheckoutToFireStore();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: 1.seconds,
                          content: Text("Added to Products"),
                        ));
                      },
                        child: Text('Add',style: TextStyle(color: Colors.white),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
}
