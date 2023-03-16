class AllMeetForTeam {
  List<TeamMeetsWithDate>? teamMeetsWithDate;

  AllMeetForTeam({this.teamMeetsWithDate});

  AllMeetForTeam.fromJson(Map<String, dynamic> json) {
    if (json['teamMeetsWithDate'] != null) {
      teamMeetsWithDate = <TeamMeetsWithDate>[];
      json['teamMeetsWithDate'].forEach((v) {
        teamMeetsWithDate!.add( TeamMeetsWithDate.fromJson(v));
      });
      teamMeetsWithDate = teamMeetsWithDate!.reversed.toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (teamMeetsWithDate != null) {
      data['teamMeetsWithDate'] =
          teamMeetsWithDate!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class TeamMeetsWithDate {
  Meet? meet;
  String? teamName;
  String? team1Name;
  String? team2Name;
  String? team3Name;
  String? team4Name;
  String? team1Score;
  String? team2Score;
  String? team3Score;
  String? team4Score;

  TeamMeetsWithDate(
      {this.meet,
        this.teamName,
        this.team1Name,
        this.team2Name,
        this.team3Name,
        this.team4Name,
        this.team1Score,
        this.team2Score,
        this.team3Score,
        this.team4Score});

  TeamMeetsWithDate.fromJson(Map<String, dynamic> json) {
    meet = json['meet'] != null ?  Meet.fromJson(json['meet']) : null;
    teamName = json['teamName'];
    team1Name = json['team1Name'];
    team2Name = json['team2Name'];
    team3Name = json['team3Name'];
    team4Name = json['team4Name'];
    team1Score = json['team1Score'];
    team2Score = json['team2Score'];
    team3Score = json['team3Score'];
    team4Score = json['team4Score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (meet != null) {
      data['meet'] = meet!.toJson();
    }
    data['teamName'] = teamName;
    data['team1Name'] = team1Name;
    data['team2Name'] = team2Name;
    data['team3Name'] = team3Name;
    data['team4Name'] = team4Name;
    data['team1Score'] = team1Score;
    data['team2Score'] = team2Score;
    data['team3Score'] = team3Score;
    data['team4Score'] = team4Score;
    return data;
  }
}

class Meet {
  String? meetId;
  String? date;

  Meet({this.meetId, this.date});

  Meet.fromJson(Map<String, dynamic> json) {
    meetId = json['meetId'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['meetId'] = meetId;
    data['date'] = date;
    return data;
  }
}
