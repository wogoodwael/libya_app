import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../admin/core/utils/app_color.dart';
import '../../../controller/address/add_controller.dart';
import '../../../handling_data/handlng_data_view.dart';
import 'edit_address_details_user.dart';


class EditLocationUser extends StatelessWidget {
  const EditLocationUser({super.key});

  @override
  Widget build(BuildContext context) {
    int addressId;
    addressId = Get.arguments['addressId'];
    Get.put(AddressController());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<AddressController>(
          builder: (controllerpage){
            return HandlingDataView(
                statusRequest: controllerpage.statusRequest,
                widget: Column(
                  children: [
                    if(controllerpage.kGooglePlex != null)
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            GoogleMap(
                              mapType: MapType.normal,
                              markers: controllerpage.markers.toSet(),
                              onTap: (latlong){
                                controllerpage.addMarker(latlong);
                              },
                              initialCameraPosition: controllerpage.kGooglePlex!,
                              onMapCreated: (GoogleMapController controllermap) {
                                controllerpage.completercontroller!.complete(controllermap);
                              },
                            ),
                            Positioned(
                              top: 0,
                              child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: .1 * MediaQuery.sizeOf(context).height,
                                decoration: const BoxDecoration(
                                    color: green,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: .01 * MediaQuery.sizeOf(context).height,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: .055 * MediaQuery.sizeOf(context).width,
                                        ),
                                        SizedBox(
                                          width: .08 * MediaQuery.sizeOf(context).width,
                                        ),
                                        const Text(
                                          "العناوين ",
                                          style: TextStyle(
                                              fontFamily: 'ArabicUIDisplayBold',
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: yellow),
                                        ),
                                        SizedBox(
                                          width: .15 * MediaQuery.sizeOf(context).width,
                                        ),
                                        //* go to menu page
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              child: InkWell(
                                onTap: (){
                                  Get.to(() => const EditAddressDetailsUser(),
                                      arguments:{
                                        "addressId" : addressId,
                                        "lat" : controllerpage.lat.toString(),
                                        "long" : controllerpage.long.toString(),
                                      }
                                  );
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: green
                                  ),
                                  child: const Center(child: Text("استمرار",style: TextStyle(color: Colors.white,fontFamily: 'ArabicUIDisplay',fontSize: 22),)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                  ],
                )
            );
          },
        ),
      ),
    );
  }
}
