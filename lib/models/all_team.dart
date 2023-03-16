class AllTeam {
  List<Teams>? teams;

  AllTeam({this.teams});

  AllTeam.fromJson(Map<String, dynamic> json) {
    if (json['teams'] != null) {
      teams = <Teams>[];
      json['teams'].forEach((v) {
        teams!.add( Teams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (teams != null) {
      data['teams'] = teams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teams {
  String? teamId;
  String? teamName;
  String? player1Name;
  String? player2Name;
  String? rank;
  String? score;

  Teams(
      {this.teamId,
        this.teamName,
        this.player1Name,
        this.player2Name,
        this.rank,
        this.score});

  Teams.fromJson(Map<String, dynamic> json) {
    teamId = json['teamId'];
    teamName = json['teamName'];
    player1Name = json['player1Name'];
    player2Name = json['player2Name'];
    rank = json['rank'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teamId'] = teamId;
    data['teamName'] = teamName;
    data['player1Name'] = player1Name;
    data['player2Name'] = player2Name;
    data['rank'] = rank;
    data['score'] = score;
    return data;
  }
}
