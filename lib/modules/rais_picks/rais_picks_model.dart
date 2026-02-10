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

  Leaugemodel({
    required this.odds,
    required this.edge,
    required this.ev,
    required this.confidence,
    required this.point,
  });
}
