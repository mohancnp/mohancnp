import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future showCustomDialog({String? message}) async {
  final context = Get.context;

  return context != null
      ? showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(message ?? "Please Wait"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                      child: SizedBox(
                    width: 30.w,
                    height: 30.h,
                    child: CircularProgressIndicator(),
                  )),
                ],
              ),
              // actions: <Widget>[
              //   TextButton(
              //     child: const Text('Approve'),
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     },
              //   ),
              // ],
            );
          },
        )
      : null;
}
