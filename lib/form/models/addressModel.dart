import 'package:vento_form_flutter/form/models/personModel.dart';

class AddressModel {
  int id = 0;
  int addressStatusId = 0;
  int personId = 0;
  int companyId = 0;
  String street = '';
  String internalNumber = '';
  String externalNumber = '';
  String zipCode = '';
  String zone = '';
  String city = '';
  String state = '';
  String country = '';
  HomeType homeType = HomeType.empty();
  String otherHomeType = '';
  int? yearsLiving = 0;
  AddressModel.empty();

  Map<String, dynamic> toJson(){
    return {"person_id": myCurrentPerson.id,
    "street": street,
    "internal_number": internalNumber,
    "external_number": externalNumber,
    "zip_code": zipCode,
    "zone": zone,
    "city": city,
    "state": state,
    "country": country,
    "home_type": homeType.name,
    "other_home_type": otherHomeType,
    "years_living": yearsLiving};
  }

  AddressModel({
    this.id = 0,
    this.addressStatusId = 0,
    this.personId = 0,
    this.street = '',
    this.internalNumber = '',
    this.externalNumber = '',
    this.zipCode = '',
    this.zone = '',
    this.city = '',
    this.state = '',
    this.country = '',
    this.otherHomeType = '',
    this.yearsLiving,
  });

  bool isReady() {
    if (street == "" ||
        state == "" ||
        zone == "" ||
        internalNumber == "" ||
        externalNumber == "" ||
        zipCode == "" ||
        city == "" ||
        country == "" ||
        yearsLiving == null ||
        (homeType.id == 6 && otherHomeType == "")) {
      return false;
    }
    return true;
  }
}

class HomeType {
  int id = 0;
  String name = "";
  String displayName = "";
  String getName() => displayName;

  HomeType.empty();

  HomeType(this.id, this.name, this.displayName);
}

List<HomeType> myHomeTypes = [
  HomeType(0, "", "Tipo de vivienda"),
  HomeType(1, "OWN", "Propio"),
  HomeType(2, "RENT", "Renta"),
  HomeType(3, "MORTAGE", "Inmobiliaria"),
  HomeType(4, "LOAN", "Préstamo"),
  HomeType(5, "FAMILY", "Familiar"),
  HomeType(6, "OTHER", "Otro"),
];

int myHomeTypeId = 0;

AddressModel myAddressModel = AddressModel.empty();
AddressModel myWorkAddressModel = AddressModel.empty();
