import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../admin/core/helper/snack.dart';
import '../../../../admin/core/utils/app_color.dart';
import '../../../../admin/core/utils/logo.dart';
import '../../../../admin/presentation/widgets/custom_next.dart';
import '../../../../admin/presentation/widgets/info_row.dart';
import '../../../controller/address/add_details_controller.dart';
import '../../../handling_data/handlng_data_view.dart';
import '../../widgets/address_text_field.dart';

class AddAddressDetailsUser extends StatefulWidget {
  const AddAddressDetailsUser({super.key});

  @override
  State<AddAddressDetailsUser> createState() => _AddAddressDetailsUserState();
}

class _AddAddressDetailsUserState extends State<AddAddressDetailsUser> {
  AddressDetailsController controller = Get.put(AddressDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offwhite,
      body: GetBuilder<AddressDetailsController>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Stack(children: [
                  Image.asset(
                    "assets/images/back.png",
                    color: Colors.grey.withOpacity(.2),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  SafeArea(
                      child: ListView(
                          children:[
                            Column(
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
                                      text: 'اسم العنوان'),
                                ),
                                CustomAddressTextField(
                                  height: 51,
                                  secure: false,
                                  controller: controller.name,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
                                  child: InfoRow(
                                    fontsize: 18,
                                    text: 'العنوان ',
                                    fontfamily: 'ArabicUIDisplay',
                                  ),
                                ),
                                CustomAddressTextField(
                                  height: 51,
                                  secure: false,
                                  controller: controller.street,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
                                  child: InfoRow(
                                    fontsize: 18,
                                    text: 'المدينة ',
                                    fontfamily: 'ArabicUIDisplay',
                                  ),
                                ),
                                CustomAddressTextField(
                                  height: 51,
                                  secure: false,
                                  controller: controller.city,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                    onTap: (){
                                      controller.addAddressUser();
                                      showSuccessSnack(context, "تمت إضافة العنوان بنجاح");
                                    },
                                    child: Center(child: CustomNext(width: 310, text: 'اضافة العنوان')))
                              ],
                            ),
                          ]
                      ))
                ])
            );
          }
      ),
    );
  }
}
