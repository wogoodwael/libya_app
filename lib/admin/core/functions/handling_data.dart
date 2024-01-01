import '../../handling_data/statusrequest.dart';

handlingData(response){
  if (response is StatusRequest) {
    return response;
  } else{
    return StatusRequest.success;
  }
}