import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fw_admin/Controllers/home_controller.dart';
import 'package:fw_admin/Pages/add_product_page.dart';
import 'package:fw_admin/Pages/orders_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var ctrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    // ctrl.fetchData(); // try to update on backpress

    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Footware Admin'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => OrdersPage());
                },
                icon: Icon(CupertinoIcons.cart))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: ctrl.products.length,
                  itemBuilder: (context, index) {
                    print('itembuilder called'); //testing............
                    print('products length : ${ctrl.products.length}');
                    return ListTile(
                      title: Text(ctrl.products[index].name!),
                      subtitle: Text('Price : ${ctrl.products[index].price!}'),
                      trailing: IconButton(
                          onPressed: () {
                            ctrl.deleteData(ctrl.products[index].id!);
                          },
                          icon: Icon(Icons.delete)),
                    );
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // what to do on pressed
            Get.to(AddProductPage());

            // ctrl.fetchData();
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
