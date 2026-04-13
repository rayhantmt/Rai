import 'package:get/get.dart';
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

  var predictions = [
    Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
      selectedTeam: 'Almeria'
    ),
    Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
      selectedTeam: 'Argentina'
    ),
    Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
      selectedTeam: 'New Reference'
    ),
    Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
      selectedTeam: 'Updated Team'
    ),
    Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
      selectedTeam: 'Select'
    ),
    Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
      selectedTeam: 'New'
    ),
    Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
      selectedTeam: 'Rugby'
    ),
    Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
      selectedTeam: 'Nobody knows'
    ),
    Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
      selectedTeam: 'Hamper rocks'
    ),
    Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
      selectedTeam: 'Sydney Stars'
    ),
    Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
      selectedTeam: 'Rocking Jones'
    ),
  ];
}
