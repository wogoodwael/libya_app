import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/core/utils/back_image.dart';
import 'package:libya_bakery/core/utils/logo.dart';
import 'package:libya_bakery/core/utils/person.dart';
import 'package:libya_bakery/presentation/screens/auth/login/sign_in_body.dart';
import 'package:libya_bakery/presentation/screens/auth/signup/widgets/sign_up_body.dart';
import 'package:libya_bakery/presentation/widgets/info_row.dart';
import 'package:libya_bakery/presentation/widgets/text_field.dart';

class CustomerInformationScreen extends StatelessWidget {
  CustomerInformationScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offwhite,
      body: Stack(children: [
        Image.asset(
          "assets/images/back.png",
          color: Colors.grey.withOpacity(.2),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: .15 * MediaQuery.sizeOf(context).height,
                decoration: const BoxDecoration(
                    color: darkGreen,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: .03 * MediaQuery.sizeOf(context).height,
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
                          "العملاء",
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
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              tabSection(context),

              // Positioned(top: 20, child: tabSection(context)),
            ],
          ),
        )),
      ]),
    );
  }
}

Widget tabSection(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Column(
      children: <Widget>[
        TabBar(
            dividerColor: darkGreen,
            labelStyle: TextStyle(
                fontFamily: 'ArabicUIDisplayBold',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                shadows: [Shadow(color: Colors.black, blurRadius: 2)]),
            labelColor: yellow,
            indicatorColor: yellow,
            indicatorWeight: 3,
            unselectedLabelColor: darkGreen,
            unselectedLabelStyle: TextStyle(
                fontFamily: 'ArabicUIDisplayBold',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                shadows: [Shadow(color: Colors.black, blurRadius: 1)]),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: yellow,
                width: 4.0,
              ),
            ),
            tabs: [
              Tab(
                text: "معلومات المتجر",
              ),
              Tab(text: "معلومات شخصية"),
            ]),
        SizedBox(
          //Add this to give height
          height: 800,

          child: TabBarView(children: [
            //*body of tab1
             
            Column(
              children: [
                SizedBox(height: 20,),
                InfoRow(
                  fontsize: 15,
                  fontfamily: 'ArabicUIDisplayBold',
                  icon: Icons.error,
                  text: 'اسم المتجر ',
                ),
                SizedBox(height: 10,),
                //todo: upload to server
                CustomTextField(
                  height: 35,
                  secure: false,
                  // controller: '',
                ),
                 SizedBox(height: 20,),
                InfoRow(
                  fontsize: 15,
                  fontfamily: 'ArabicUIDisplayBold',
                  icon: Icons.error,
                  text: 'عنوان المتجر',
                ),
                SizedBox(height: 10,),
                //todo: upload to server
                CustomTextField(
                  height: 35,
                  secure: false,
                  // controller: '',
                ),
                SizedBox(height: 20,),
                InfoRow(
                  fontsize: 15,
                  fontfamily: 'ArabicUIDisplayBold',
                  icon: Icons.error,
                  text: 'المدينة',
                ),
                SizedBox(height: 10,),
                //todo: upload to server
                CustomTextField(
                  height: 35,
                  secure: false,
                  // controller: '',
                ),
                SizedBox(height: 20,),
                InfoRow(
                  fontsize: 15,
                  fontfamily: 'ArabicUIDisplayBold',
                  icon: Icons.error,
                  text: 'رقم هاتف للمتجر',
                ),
                SizedBox(height: 10,),
                //todo: upload to server
                CustomTextField(
                  height: 35,
                  secure: false,
                  // controller: '',
                ),
                  SizedBox(height: 20,),
                InfoRow(
                  fontsize: 15,
                  fontfamily: 'ArabicUIDisplayBold',
                  icon: Icons.error,
                  text: 'موقع المتجر',
                ),
                SizedBox(height: 10,),
                 SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: .8 * MediaQuery.sizeOf(context).width,
                          height: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: ExactAssetImage(
                                      "assets/images/map.png")),
                              color: darkGreen,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 0.0,
                                  color: Colors.grey,
                                ),
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          width: .8 * MediaQuery.sizeOf(context).width,
                          height: 45,
                          decoration: const BoxDecoration(
                              color: Color(0xffbFED700),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          child: const Center(
                            child: Text(
                              "حفظ",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplayBold",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: darkGreen,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
              ],
            ),

            //*body of tab 2

           Column(
            children: [
              SizedBox(height: 20,),
                InfoRow(
                  fontsize: 15,
                  fontfamily: 'ArabicUIDisplayBold',
                  icon: Icons.error,
                  text: 'الاسم الاول',
                ),
                SizedBox(height: 10,),
                //todo: upload to server
                CustomTextField(
                  height: 35,
                  secure: false,
                  // controller: '',
                ),
                SizedBox(height: 20,),
                InfoRow(
                  fontsize: 15,
                  fontfamily: 'ArabicUIDisplayBold',
                  icon: Icons.error,
                  text: 'اسم العائلة',
                ),
                SizedBox(height: 10,),
                //todo: upload to server
                CustomTextField(
                  height: 35,
                  secure: false,
                  // controller: '',
                ),
                  SizedBox(height: 20,),
                
                InfoRow(
                  fontsize: 15,
                  fontfamily: 'ArabicUIDisplayBold',
                  icon: Icons.error,
                  text: 'البريد الالكتروني',
                ),
                SizedBox(height: 10,),
                //todo: upload to server
                CustomTextField(
                  height: 35,
                  secure: false,
                  // controller: '',
                ),
                  SizedBox(height: 20,),
                      InfoRow(
                  fontsize: 15,
                  fontfamily: 'ArabicUIDisplayBold',
                  icon: Icons.error,
                  text: 'رقم الهاتف المحمول',
                ),
                SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        height: 35,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:[
                          Icon(Icons.keyboard_arrow_down,size: 30,color: darkGreen,),
                          Image.asset("assets/images/libya.png"),
                          
                          Text("+211")
                          ]
                        ),
                      ),
                   
                      Container(
      margin: EdgeInsets.symmetric(
          horizontal: .07 * MediaQuery.sizeOf(context).width),
      width: .50 * MediaQuery.sizeOf(context).width,
      height: 35,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        
        textAlign: TextAlign.end,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(fontSize: 20),
        decoration:
            InputDecoration(border: InputBorder.none, ),
      ),
    ),
                      
                    ],
                  ),
                  SizedBox(height: 50,),
                    Column(
                      children: [
                        Container(
                          width: .8 * MediaQuery.sizeOf(context).width,
                          height: 45,
                          decoration: const BoxDecoration(
                              color: Color(0xffbFED700),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          child: const Center(
                            child: Text(
                              "حفظ",
                              style: TextStyle(
                                fontFamily: "ArabicUIDisplayBold",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: darkGreen,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  
            ],
           )
            
          ]),
        ),
      ],
    ),
  );
}
