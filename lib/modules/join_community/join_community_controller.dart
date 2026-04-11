import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../api_services/api_services.dart';

class JoinCommunityController extends GetxController {
  var isLoading = false.obs;
  final codecontroller=TextEditingController();
  Future<void> joinCommunityByCode() async {
     final token=GetStorage().read('token');
    try {
      isLoading(true);
      final response = await ApiService.post(
        endpoint: '/api/community/join_by_code/',
        body: {"invite_code": codecontroller.text},
         headers: {'Authorization': 'Bearer $token'},
      );

      if (response != null && response['success'] == true) {
        Get.back();
        Get.snackbar(
          'Success',
          response['message'] ?? 'Joined community successfully',
          backgroundColor: Color(0xff10B981),
          colorText: Color(0xffEEEEF0),
        );
      } else {
        Get.snackbar(
          'Failed',
          response?['message'] ?? 'Invalid invite code',
          backgroundColor: Color(0xffEF4444),
          colorText: Color(0xffEEEEF0),
        );
      }
    } catch (e) {
      print('joinCommunityByCode error: $e');
      Get.snackbar(
        'Error',
        'Something went wrong',
        backgroundColor: Color(0xffEF4444),
        colorText: Color(0xffEEEEF0),
      );
    } finally {
      isLoading(false);
    }
  }
}
