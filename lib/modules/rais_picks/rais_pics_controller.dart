import 'package:get/get.dart';
import 'package:rai/modules/rais_picks/rais_picks_model.dart';

class RaisPicsController extends GetxController{
  var selectedCategoryIndex=0.obs;
  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }
  var picks=[
    Picksmodel(type: 'Bang for Buck'),
    Picksmodel(type: 'Parlay Builder'),
    Picksmodel(type: 'Daily Picks'),
    Picksmodel(type: 'Pick of the Day'),
  ];
  var games=[
    RaisPicksModel(gametype: 'Basketball'),
    RaisPicksModel(gametype: 'Football'),
    RaisPicksModel(gametype: 'Hockey'),
    RaisPicksModel(gametype: 'Tenis'),
    RaisPicksModel(gametype: 'Cricket')
  ];
}