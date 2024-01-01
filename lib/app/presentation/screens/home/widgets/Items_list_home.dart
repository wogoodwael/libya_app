import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../api_connection/api_connection.dart';
import '../../../../controller/home_controller.dart';
import '../../../../models/items_model.dart';
import '../../../../services/MyServices.dart';

class ItemsListHome extends GetView<HomeControllerImp> {
  const ItemsListHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemBuilder: (context, index) {
            return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
              Items(
                itemsModel: ItemsModel.fromJson(controller.items[index])
            ),
          );
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    var userType = int.parse(MyServices.sharedPreferences.getString("user_type").toString());
    return Card(
      color: Colors.white,
      child: Stack(
        children: [
          if(itemsModel.itemsDiscount != 0 && userType == 1 || itemsModel.shopownerDiscount !=0 && userType == 2 || itemsModel.fornownerDicount !=0 && userType == 3)
            SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.32,
            child: Image.network(
              '${API.itemsImages}/${itemsModel.itemsImage}',
              fit: BoxFit.fitWidth,
            ),
          ),
          if(itemsModel.itemsDiscount != 0 && userType == 1 || itemsModel.shopownerDiscount !=0 && userType == 2 || itemsModel.fornownerDicount !=0 && userType == 3)
          Positioned(
            top: 0,
            left: 8,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.red.shade800,
              child: Text(
                userType == 1 ?
                  "${itemsModel.itemsDiscount}%"
                    :
                userType == 2 ?
                "${itemsModel.shopownerDiscount}%"
                    :
                userType == 3 ?
                "${itemsModel.fornownerPrice}%"
                    :
                "${itemsModel.itemsDiscount}%"
              ),
            ),
          )
        ],
      ),
    );
  }
}

