import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fw_admin/Controllers/home_controller.dart';

import 'package:get/get.dart';

class OrdersPage extends StatelessWidget {
  var ctrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      ctrl.fetchOrders();
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Orders',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: ctrl.orderList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading:
                          Image.network(ctrl.orderList[index].image.toString()),
                      title: Text(ctrl.orderList[index].name!),
                      subtitle: Text('Price : ${ctrl.orderList[index].price!}'),
                      trailing: IconButton(
                          onPressed: () {
                            ctrl.deleteData(ctrl.orderList[index].id!);
                          },
                          icon: Icon(Icons.delete)),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
