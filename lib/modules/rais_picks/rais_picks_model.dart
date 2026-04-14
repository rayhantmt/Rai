class RaisPicksModel {
  final String gametype;

  RaisPicksModel({required this.gametype});
}

class Picksmodel {
  final String type;

  Picksmodel({required this.type});
}

// class Leaugemodel {
//   final String odds;
//   final String edge;
//   final String ev;
//   final String confidence;
//   final String point;
//   final String selectedTeam;

//   Leaugemodel({
//     required this.odds,
//     required this.edge,
//     required this.ev,
//     required this.confidence,
//     required this.point,
//     required this.selectedTeam,
//   });
// }

class bettinginfo {
  final String image1;
  final String image2;

  bettinginfo({required this.image1, required this.image2});
}
class Leaugemodel {
  final String id;
  final String homeTeam;
  final String awayTeam;
  final String? homeTeamLogo;
  final String? awayTeamLogo;
  final String sport;
  final String selectedTeam;
  final String pickType;
  final double? pointSpread;
  final String odds;
  final String edge;
  final String ev;
  final String confidence;
  final String point;
  final bool isPickOfTheDay;
  final String? expertName;
  final String? expertPhoto;
  final String? breakdownText;
  final String matchId;
  final String createdAt;

  Leaugemodel({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    this.homeTeamLogo,
    this.awayTeamLogo,
    required this.sport,
    required this.selectedTeam,
    required this.pickType,
    this.pointSpread,
    required this.odds,
    required this.edge,
    required this.ev,
    required this.confidence,
    required this.point,
    required this.isPickOfTheDay,
    this.expertName,
    this.expertPhoto,
    this.breakdownText,
    required this.matchId,
    required this.createdAt,
  });

  factory Leaugemodel.fromJson(Map<String, dynamic> json) {
    final oddsRaw = json['odds_american'] ?? 0;
    final oddsFormatted = oddsRaw >= 0 ? '+$oddsRaw' : '$oddsRaw';

    final edgeRaw = json['edge_percentage'] ?? 0.0;
    final evRaw = json['ev_percentage'] ?? 0.0;
    final confidenceRaw = json['confidence_percentage'] ?? 0;
    final spreadRaw = json['point_spread'];

    return Leaugemodel(
      id: json['id'] ?? '',
      homeTeam: json['home_team'] ?? '',
      awayTeam: json['away_team'] ?? '',
      homeTeamLogo: json['home_team_logo'],
      awayTeamLogo: json['away_team_logo'],
      sport: json['sport'] ?? '',
      selectedTeam: json['team_selected'] ?? '',
      pickType: json['pick_type'] ?? '',
      pointSpread: spreadRaw != null ? (spreadRaw as num).toDouble() : null,
      odds: oddsFormatted,
      edge: '+${edgeRaw.toString()}%',
      ev: '+${evRaw.toString()}%',
      confidence: '$confidenceRaw%',
      point: spreadRaw != null
          ? (spreadRaw >= 0 ? '+$spreadRaw' : '$spreadRaw')
          : oddsFormatted,
      isPickOfTheDay: json['is_pick_of_the_day'] ?? false,
      expertName: json['expert_name'],
      expertPhoto: json['expert_photo'],
      breakdownText: json['breakdown_text'],
      matchId: json['match'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
  String get sportLabel {
  final Map<String, String> sportMap = {
    // Soccer
    'soccer_spain_la_liga': 'Soccer',
    'soccer_spain_segunda_division': 'Soccer',
    'soccer_germany_bundesliga': 'Soccer',
    'soccer_germany_liga3': 'Soccer',
    'soccer_italy_serie_b': 'Soccer',
    'soccer_epl': 'Soccer',
    'soccer_france_ligue_one': 'Soccer',
    'soccer_italy_serie_a': 'Soccer',
    'soccer_uefa_champs_league': 'Soccer',
    'soccer_usa_mls': 'Soccer',

    // Baseball
    'baseball_mlb': 'Baseball',
    'baseball_ncaa': 'Baseball',

    // Basketball
    'basketball_nba': 'Basketball',
    'basketball_ncaab': 'Basketball',
    'basketball_wnba': 'Basketball',

    // American Football
    'americanfootball_nfl': 'Football',
    'americanfootball_ncaaf': 'Football',

    // Hockey
    'icehockey_nhl': 'Hockey',

    // Tennis
    'tennis_atp': 'Tennis',
    'tennis_wta': 'Tennis',

    // MMA / Boxing
    'mma_mixed_martial_arts': 'MMA',
    'boxing_boxing': 'Boxing',
  };

  return sportMap[sport] ?? 
      sport
        .replaceAll('_', ' ')
        .split(' ')
        .last
        .split('')
        .asMap()
        .entries
        .map((e) => e.key == 0 ? e.value.toUpperCase() : e.value)
        .join();
}
}