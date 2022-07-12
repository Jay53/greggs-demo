import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Global {
  static showSnackBar(
    String title,
    String message, {
    Color? bgColor,
    Color? fontColor,
    Duration? duration,
  }) {
    bgColor ??= Colors.redAccent;
    fontColor ??= Colors.white;
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: fontColor,
      backgroundColor: bgColor,
      margin: const EdgeInsets.all(8),
      duration: duration ?? const Duration(seconds: 3),
    );
  }

  static printResponse(String callType, http.Response response) {
    debugPrint('----------------------------------------------------------');
    debugPrint('Res_URL : $callType > ${response.request!.url}');
    debugPrint('Res_STATUS_CODE : ${response.statusCode}');
    debugPrint('Res_BODY : ${response.body}');
    debugPrint('==========================================================');
  }
}
