import 'package:flutter/material.dart';
import 'package:libya_bakery/handling_data/statusrequest.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset('assets/lottie/loading.json'),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset('assets/lottie/offline.json'),
              )
            : statusRequest == StatusRequest.failure
                ? Center(
                    child: Lottie.asset('assets/lottie/server.json'),
                  )
                : statusRequest == StatusRequest.serverfailure
                    ? Center(
                        child: Lottie.asset('assets/lottie/failure.json'),
                      )
                    : widget;
  }
}
