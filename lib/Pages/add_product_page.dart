import 'package:flutter/material.dart';
import 'package:fw_admin/widgets/custom_textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fw_admin/widgets/drop_down.dart';
import 'package:get/get.dart'; 
import 'package:fw_admin/Controllers/home_controller.dart';

class AddProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Product',
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(12),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Add New Product',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                customTextField(
                    contrl: ctrl.productNameCtrl,
                    lable: 'Product Name',
                    hint: 'Enter product name',
                    maxline: 1),
                SizedBox(
                  height: 15,
                ),
                customTextField(
                    contrl: ctrl.productDescCtrl,
                    lable: 'Product Description',
                    hint: 'Enter product description',
                    maxline: 4),
                SizedBox(
                  height: 15,
                ),
                customTextField(
                    contrl: ctrl.productImgCtrl,
                    lable: 'Product Image',
                    hint: 'Enter Image url',
                    maxline: 1),
                SizedBox(
                  height: 15,
                ),
                customTextField(
                    contrl: ctrl.productPriceCtrl,
                    lable: 'Price',
                    hint: 'Enter product price',
                    maxline: 1),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Flexible(
                        child: DropDown(
                      items: ['Loafers', 'Slippers', 'Sandals','Shoes','Boots','Sneaks'],
                      selectedItemText: ctrl.category,
                      onSelected: (onselectedValue) {
                        ctrl.category = onselectedValue ?? 'general';
                        ctrl.update();
                      },
                    )),
                    Flexible(
                        child: DropDown(
                           
                      items: ['Nike', 'Adidas', 'Puma','Skechers'],
                      selectedItemText: ctrl.brand,
                      onSelected: (onselectedValue) {
                        ctrl.brand = onselectedValue ?? 'un branded';
                        ctrl.update();
                      },
                    )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Offer Product ?',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                SizedBox(
                  height: 15,
                ),
                DropDown(
                  items: ['true', 'false'],
                  selectedItemText: ctrl.offer,
                  onSelected: (onselectedValue) {
                    ctrl.offer = onselectedValue ?? 'false';
                    ctrl.update();
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigoAccent,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      ctrl.addProduct();
                    },
                    child: Text('Add Product'))
              ],
            ),
          ),
        ),
      );
    });
  }
}
