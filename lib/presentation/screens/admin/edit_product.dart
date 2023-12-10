import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/presentation/screens/admin/add_product.dart';
import 'package:libya_bakery/presentation/screens/admin/add_products_container.dart';
import 'package:libya_bakery/presentation/screens/menu.dart';

class EditProductScreen extends StatelessWidget {
   EditProductScreen({super.key});
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: offwhite,
      key: scaffoldKey,
      endDrawer: const Drawer(
        width: 250,
        child: MenuScreen(),
      ),
      body: Stack(
        children: [
          const BackGroundImage(),
          SingleChildScrollView(
            child: Column(children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: .20 * MediaQuery.sizeOf(context).height,
                decoration: const BoxDecoration(
                    color: darkGreen,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: .06 * MediaQuery.sizeOf(context).height,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: .01 * MediaQuery.sizeOf(context).width,
                        ),
                        Person(),

                        SizedBox(
                          width: .12 * MediaQuery.sizeOf(context).width,
                        ),
                        const Text(
                          "المنتجات",
                          style: TextStyle(
                              fontFamily: 'ArabicUIDisplayBold',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: yellow),
                        ),
                        SizedBox(
                          width: .15 * MediaQuery.sizeOf(context).width,
                        ),
                        //* go to menu page
                        GestureDetector(
                            onTap: () {
                              var scaffoldKey;
                              scaffoldKey.currentState!.openEndDrawer();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                width: 30,
                                height: 25,
                                child: Image.asset(
                                  "assets/images/icon_menu.png",
                                  color: yellow,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: .04 * MediaQuery.sizeOf(context).height,
                    )
                  ],
                ),
              ),
            
             const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                     const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: Text(
                            
                            "تعديل منتج",
                            style: TextStyle(
                                fontFamily: 'ArabicUIDisplayBold',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: darkGreen),
                          ),
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 40,
                          color: green,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    const Divider(
                      endIndent: 9,
                      indent: 5,
                      color: darkGreen,
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  const AddProductsContainerScreen(),
                    const SizedBox(
                      height: 10,
                    ),
                     Column(
                        children: [
              Container(
                width: .8*MediaQuery.sizeOf(context).width,
                height: 45,
                decoration: const BoxDecoration(
                  color: Color(0xffbFED700),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20))
                ),
                child: const Center(
                  child: Text(
                             "تعديل",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplayBold",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: darkGreen,
                              ),
                  ),
                ),
              ),
                        ],
                      ),
                      const SizedBox(height: 50,),
                    
         ] ),
          ]  ,
          )
        
        ),
        ],),
    );
 
  }
}