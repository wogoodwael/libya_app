import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../admin/handling_data/statusrequest.dart';
import '../functions/check_internet.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async{
    try{
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkUrl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    }catch(_){
      return const Left(StatusRequest.serverfailure);
    }
  }
}