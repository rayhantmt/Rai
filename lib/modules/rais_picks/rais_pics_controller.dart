import 'package:get/get.dart';
import 'package:rai/modules/rais_picks/rais_picks_model.dart';

class RaisPicsController extends GetxController {
  var selectedCategoryIndex = 0.obs;
  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  var picks = [
    Picksmodel(type: 'Bang for Buck'),
    Picksmodel(type: 'Parlay Builder'),
    Picksmodel(type: 'Daily Picks'),
    Picksmodel(type: 'Pick of the Day'),
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
    ),
     Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
    ),
     Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
    ),
     Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
    ),
     Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
    ),
     Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
    ),
     Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
    ),
     Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
    ),
     Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
    ),
     Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
    ),
     Leaugemodel(
      odds: '153+',
      edge: "+8.23%",
      ev: '+9.83%',
      confidence: '82%',
      point: '+5.5',
    ),
  ];
}
