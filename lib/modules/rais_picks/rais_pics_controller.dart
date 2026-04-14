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
  // var games = [
  //   RaisPicksModel(gametype: 'basketball'),
  //   RaisPicksModel(gametype: 'football'),
  //   RaisPicksModel(gametype: 'Hockey'),
  //   RaisPicksModel(gametype: 'Tenis'),
  //   RaisPicksModel(gametype: 'Cricket'),
  // ];
  var games = [
  RaisPicksModel(gametype: 'All',        sportKey: 'all'),
  RaisPicksModel(gametype: 'Basketball', sportKey: 'basketball'),
  RaisPicksModel(gametype: 'Football',   sportKey: 'football'),
  RaisPicksModel(gametype: 'Hockey',     sportKey: 'hockey'),
  RaisPicksModel(gametype: 'Tennis',     sportKey: 'tennis'),
  RaisPicksModel(gametype: 'Cricket',    sportKey: 'cricket'),
  RaisPicksModel(gametype: 'Soccer',     sportKey: 'soccer'),
  RaisPicksModel(gametype: 'Baseball',   sportKey: 'baseball'),
];
  RxInt picksindex = 0.obs;
  RxInt gamesindex = 0.obs;
  void selectpicks(int index) {
    print(picksindex.value);
    print('Picks inedx $index');
    picksindex.value = index;
  }

  // void selectgames(int index,String gametype) {

  //   fetchPredictions();
  //   gamesindex.value = index;
  //   print(gamesindex.value);
  //   print('Games inedx $index');
  // }

  var predictions = <Leaugemodel>[].obs;

  // New variable for pick of the day screen
  var pickOfTheDay = <Leaugemodel>[].obs;
// Stores all fetched picks — never modified after fetch
var allPredictions = <Leaugemodel>[].obs;
void selectgames(int index, String gametype) {
  gamesindex.value = index;
  _filterPredictions(games[index].sportKey);
}

void _filterPredictions(String sportKey) {
  if (sportKey == 'all') {
    predictions.value = allPredictions.toList();
  } else {
    predictions.value = allPredictions
        .where((e) => e.sportLabel.toLowerCase() == sportKey.toLowerCase())
        .toList();
  }
}
// This is what the view renders — filtered version
// predictions stays as your existing variable, just reassigned on filter
  var isLoading = false.obs;

  // Future<void> fetchPredictions() async {
  //   final token = GetStorage().read('token');
  //   try {
  //     isLoading(true);
  //     final response = await ApiService.get(
  //       endpoint: '/api/betting/bang_for_buck/',
  //       headers: {'Authorization': 'Bearer $token'},
  //     );

  //     if (response != null && response['success'] == true) {
  //       final List data = response['data'];
  //       final allPicks = data.map((e) => Leaugemodel.fromJson(e)).toList();

  //       // All picks
  //       predictions.value = allPicks.where((e) => !e.isPickOfTheDay).toList();

  //       // Pick of the day picks — ready for the other screen
  //       pickOfTheDay.value = allPicks.where((e) => e.isPickOfTheDay).toList();
  //     }
  //     print(response);
  //   } catch (e) {
  //     print('fetchPredictions error: $e');
  //   } finally {
  //     isLoading(false);
  //   }
  // }
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

      // store master list — never touch this after
      allPredictions.value = allPicks.where((e) => !e.isPickOfTheDay).toList();
      pickOfTheDay.value = allPicks.where((e) => e.isPickOfTheDay).toList();

      // init predictions with all data
      predictions.value = allPredictions.toList();
    }
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
