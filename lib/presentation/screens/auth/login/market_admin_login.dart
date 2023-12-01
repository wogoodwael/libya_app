import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/presentation/widgets/custom_next.dart';
import 'package:libya_bakery/presentation/widgets/info_row.dart';
import 'package:libya_bakery/core/utils/logo.dart';
import 'package:libya_bakery/presentation/widgets/text_field.dart';

class MarketLoginScreen extends StatelessWidget {
  const MarketLoginScreen({super.key});

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
              const Logo(),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                indent: 10,
                endIndent: 10,
                thickness: 3,
                color: darkGreen,
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "يرجي ادخال المعلومات الاتية ",
                  style: TextStyle(
                      fontFamily: 'ArabicUIDisplay',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: green),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 20, bottom: 5),
                child: InfoRow(
                    fontsize: 18,
                    fontfamily: 'ArabicUIDisplay',
                    text: 'اسم المتجر'),
              ),
              CustomTextField(height: 40, secure: false),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
                child: InfoRow(
                  fontsize: 18,
                  text: 'العنوان ',
                  fontfamily: 'ArabicUIDisplay',
                ),
              ),
              CustomTextField(height: 40, secure: false),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
                child: InfoRow(
                  fontsize: 18,
                  text: 'المدينة ',
                  fontfamily: 'ArabicUIDisplay',
                ),
              ),
              CustomTextField(height: 40, secure: false),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
                child: InfoRow(
                  fontsize: 18,
                  text: 'تحديد موقع المتجر  ',
                  fontfamily: 'ArabicUIDisplay',
                ),
              ),
              Stack(children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  width: 310,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/location.png"),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    bottom: 35,
                    left: 160,
                    child: Image.asset("assets/images/map.png"))
              ]),
              const SizedBox(
                height: 30,
              ),
              Center(child: CustomNext(width: 310, text: 'تسجيل الحساب '))
            ],
          ),
        ))
      ]),
    );
  }
}
