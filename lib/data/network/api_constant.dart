class ApiConstant {
  static const String _version = 'v4';

  ///See today's matches of your subscribed competitions
  static const String todayMatches = '$_version/matches';

  ///get Team data by id => /teams/{id}
  static const String teamById = '$_version/teams/';
}
