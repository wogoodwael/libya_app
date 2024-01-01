import 'package:get/get.dart';

import '../../../api_connection/api_connection.dart';
import '../../../core/class/crud.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  getData(int userId) async{
    var response = await crud.postData(API.addressView, {
      'userid': userId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(int userId, String name, String city, String street, String lat, String long) async{
    var response = await crud.postData(API.addressAdd, {
      'userid': userId.toString(),
      'addressname': name,
      'city': city,
      'street': street,
      'lat': lat,
      'long': long,
    });
    return response.fold((l) => l, (r) => r);
  }

  addDataUser(int userId, String name, String city, String street, String lat, String long) async{
    var response = await crud.postData(API.addressAdd, {
      'userid': userId.toString(),
      'addressname': name,
      'city': city,
      'street': street,
      'lat': lat,
      'long': long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData (int addressId) async{
    var response = await crud.postData(API.addressDelete, {
      'address_id' : addressId.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(int addressId, String name, String city, String street, String lat, String long) async{
    var response = await crud.postData(API.addressEdit, {
      "addressid" : addressId.toString(),
      'addressname': name,
      'city': city,
      'street': street,
      'lat': lat,
      'long': long,
    });
    return response.fold((l) => l, (r) => r);
  }
}