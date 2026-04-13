class RaisPicksModel {
  final String gametype;

  RaisPicksModel({required this.gametype});
}

class Picksmodel {
  final String type;

  Picksmodel({required this.type});
}

class Leaugemodel {
  final String odds;
  final String edge;
  final String ev;
  final String confidence;
  final String point;
  final String selectedTeam;

  Leaugemodel({
    required this.odds,
    required this.edge,
    required this.ev,
    required this.confidence,
    required this.point,
    required this.selectedTeam
  });
}
class bettinginfo{
  final String image1;
  final String image2;

  bettinginfo({required this.image1, required this.image2});
}
