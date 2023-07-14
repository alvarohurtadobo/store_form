class Nationality {
  int id = 0;
  String name = "";
  String displayName= "";
  Nationality(this.id, this.displayName, this.name);

  String getName() => displayName;
}

List<Nationality> myNationalities = [
  Nationality(0, "Nacionalidad", ""),
  Nationality(1, "Mexicana", "MEXICAN"),
  Nationality(2, "Extranjera", "FOREIGN"),
];

int myNationalityId = 0;