import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rai/api_services/api_services.dart';
import 'package:rai/exceptions/app_exceptions.dart';
import 'package:rai/modules/rais_picks/rais_picks_model.dart';
import 'package:rai/utils/app_images.dart';

class RaisPicsController extends GetxController {
  var selectedCategoryIndex = 0.obs;
  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  var bets = [
    bettinginfo(image1: AppImages.betone, image2: AppImages.bettow),
    bettinginfo(image1: AppImages.betone, image2: AppImages.bettow),
    bettinginfo(image1: AppImages.betone, image2: AppImages.bettow),
    bettinginfo(image1: AppImages.betone, image2: AppImages.bettow),
    bettinginfo(image1: AppImages.betone, image2: AppImages.bettow),
    bettinginfo(image1: AppImages.betone, image2: AppImages.bettow),
    bettinginfo(image1: AppImages.betone, image2: AppImages.bettow),
    bettinginfo(image1: AppImages.betone, image2: AppImages.bettow),
    bettinginfo(image1: AppImages.betone, image2: AppImages.bettow),
  ];
  var picks = [
    Picksmodel(type: 'Bang for Buck'),
    Picksmodel(type: 'Bet Builder'),
    Picksmodel(type: 'Daily Picks'),
    Picksmodel(type: "Creator's Pick"),
  ];
  var games = [
    RaisPicksModel(gametype: 'Basketball'),
    RaisPicksModel(gametype: 'Football'),
    RaisPicksModel(gametype: 'Hockey'),
    RaisPicksModel(gametype: 'Tenis'),
    RaisPicksModel(gametype: 'Cricket'),
  ];
  RxInt picksindex = 0.obs;
  RxInt gamesindex = 0.obs;
  void selectpicks(int index) {
    print(picksindex.value);
    print('Picks inedx $index');
    picksindex.value = index;
  }

  void selectgames(int index) {
    gamesindex.value = index;
    print(gamesindex.value);
    print('Games inedx $index');
  }

  var predictions = <Leaugemodel>[].obs;

  // New variable for pick of the day screen
  var pickOfTheDay = <Leaugemodel>[].obs;

  var isLoading = false.obs;

  Future<void> fetchPredictions() async {
    final token = GetStorage().read('token');
    try {
      isLoading(true);
      final response = await ApiService.get(
        endpoint: '/api/betting/bang_for_buck/',
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response != null && response['success'] == true) {
        final List data = response['data'];
        final allPicks = data.map((e) => Leaugemodel.fromJson(e)).toList();

        // All picks
        predictions.value = allPicks.where((e) => !e.isPickOfTheDay).toList();

        // Pick of the day picks — ready for the other screen
        pickOfTheDay.value = allPicks.where((e) => e.isPickOfTheDay).toList();
      }
      print(response);
    } catch (e) {
      print('fetchPredictions error: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchPredictions();
    super.onInit();
  }

  var isLoading2 = false.obs;
  Future<void> addtoBetbuilder(var id) async {
    final token = GetStorage().read('token');
    final body = {''};

    isLoading2.value = true;
    try {
      final response = await ApiService.post(
        endpoint: '/api/betting/$id/toggle_save/',

        headers: {'Authorization': 'Bearer $token'},
      );
      Get.snackbar('Success', 'Added successfully to bet biulder');
      print("Bet builder Added: $response");
    } on AppException catch (e) {
      Get.snackbar(
        'Failed',
        e.message,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading2.value = false;
    }
  }
}
