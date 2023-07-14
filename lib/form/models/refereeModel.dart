class Referee {
  int id = 0;
  String name = "";
  String phone = "";
  int personId = 0;
  Referee.empty();

  Map<String, dynamic> toJson() {
    return {"name": name, "phone": phone};
  }
}

Referee myReferee1 = Referee.empty();
Referee myReferee2 = Referee.empty();
Referee myReferee3 = Referee.empty();
