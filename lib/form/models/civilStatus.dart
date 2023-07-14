class CivilStatus {
  int id = 0;
  String name = "";
  String displayName= "";
  CivilStatus(this.id, this.displayName, this.name);

  String getName() => displayName;
}

List<CivilStatus> myCivilStatuses = [
  CivilStatus(0, "Estado Civil", ""),
  CivilStatus(1, "Soltero", "SINGLE"),
  CivilStatus(2, "Casado", "MARRIED"),
  CivilStatus(3, "Divorciado", "DIVORCED"),
  CivilStatus(4, "Unión libre", "FREE_UNION"),
  // SINGLE,
  // MARRIED,
  // DIVORCED,
  // FREE_UNION,
];

int myCivilStatusId = 0;

class MarriageType {
  int id = 0;
  String name = "";
  String displayName= "";
  MarriageType(this.id, this.displayName, this.name);

  String getName() => displayName;
}

List<MarriageType> myMarriageTypees = [
  MarriageType(0, "Tipo de Matrimonio", ""),
  MarriageType(1, "Bienes mancomunados", "COMMUNITY_PROPERTY"),
  MarriageType(2, "Bienes separados", "SEPARATE_PROPERTY"),
  MarriageType(3, "Unión libre", "FREE_UNION"),
  MarriageType(4, "Otros", "OTHER"),
  // COMMUNITY_PROPERTY, SEPARATE_PROPERTY, FREE_UNION, OTHER
];

int myMarriageTypeId = 0;