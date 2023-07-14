import 'package:vento_form_flutter/form/models/personModel.dart';

class CompanyModel {
  int id = 0;
  int personId = 0;
  int companyStatusId = 0;
  String name = '';
  String lastBossName = '';
  String currentAddress = '';
  LaborOld laborOld = LaborOld.empty();
  String phoneNumber = '';
  // double monthlyIncome = 0.0; // Define if will stay here
  // double otherIncome = 0.0; // Should remain here?
  CompanyActivity activity = CompanyActivity.empty();
  Charge charge = Charge.empty();

  CompanyModel.empty();

  Map<String, dynamic> toJson(){
    return {"person_id": myCurrentPerson.id,
        "name": name,
        "last_boss_name": lastBossName,
        "labor_old": laborOld.name,
        "phone_number": phoneNumber,
        "activity": activity.name,
        "charge": charge.name};
  }

  CompanyModel({
    this.id = 0,
    this.personId = 0,
    this.companyStatusId = 0,
    this.name = '',
    this.lastBossName = '',
    this.currentAddress = '',
    // this.laborOld,
    this.phoneNumber = '',
    // this.monthlyIncome = 0.0,
    // this.otherIncome = 0.0,
    // this.activity,
    // this.charge,
  });

  bool isReady() {
    if (name == "" ||
        lastBossName == "" ||
        laborOld.id == 0 ||
        phoneNumber == "" ||
        activity.id == 0 ||
        charge.id == 0) {
      return false;
    }
    return true;
  }
}

class LaborOld {
  int id = 0;
  String name = "";
  String displayName = "";
  LaborOld.empty();
  LaborOld(this.id, this.name, this.displayName);
  String getName() => displayName;
// 0_9_MONTHS
//   9_12_MONTHS
//   1_2_YEARS
//   2_3_YEARS
//   3_4_YEARS
//   4_5_YEARS
//   MORE_5_YEARS
}

List<LaborOld> myLaborOlds = [
  LaborOld(0, "", "Antiguedad"),
  LaborOld(1, "0_9_MONTHS", "0 a 9 meses"),
  LaborOld(2, "9_12_MONTHS", "9 a 12 meses"),
  LaborOld(3, "1_2_YEARS", "1 a 2 años"),
  LaborOld(4, "2_3_YEARS", "2 a 3 años"),
  LaborOld(5, "3_4_YEARS", "3 a 4 años"),
  LaborOld(6, "4_5_YEARS", "4 a 5 años"),
  LaborOld(7, "MORE_5_YEARS", "más de 5 años"),
];

int myLaborOldId = 0;

class CompanyActivity {
  // Define the structure and properties of the CompanyActivity class
  int id = 0;
  String name = "";
  String displayName = "";
  CompanyActivity(this.id, this.name, this.displayName);
  CompanyActivity.empty();
  String getName() => displayName;
  // COMERCE
  // PROFESSIONAL
  // INDUSTRIAL
  // SERVICES
  // BUILDING
  // AGRICULTURE
  // OTHER
}

List<CompanyActivity> myCompanyActivities = [
  CompanyActivity(0, '', 'Actividad de empresa'),
  CompanyActivity(1, 'COMERCE', 'Comercio'),
  CompanyActivity(2, 'PROFESSIONAL', 'Servicios profesionales'),
  CompanyActivity(3, 'INDUSTRIAL', 'Industria'),
  CompanyActivity(4, 'SERVICES', 'Servicios'),
  CompanyActivity(5, 'BUILDING', 'Construcción'),
  CompanyActivity(6, 'AGRICULTURE', 'Agricultura'),
  CompanyActivity(7, 'OTHER', 'Otros'),
];

int myCompanyActivityId = 0;

class Charge {
  // Define the structure and properties of the Charge class
  int id = 0;
  String name = "";
  String displayName = "";
  Charge(this.id, this.name, this.displayName);
  Charge.empty();
  String getName() => displayName;
  // EMPLOYEE
  // OFFICIAL
  // EXECUTIVE
  // PARTNER
  // INDEPENDENT
  // PENSIONARY
  // OTHER
}

List<Charge> myCharges = [
  Charge(0, "", "Puesto"),
  Charge(1, "EMPLOYEE", "Empleado"),
  Charge(2, "OFFICIAL", "Oficial"),
  Charge(3, "EXECUTIVE", "Ejecutivo"),
  Charge(4, "PARTNER", "Socio"),
  Charge(5, "INDEPENDENT", "Independiente"),
  Charge(6, "PENSIONARY", "Jubilado"),
  Charge(7, "OTHER", "Otro"),
];

int myChargeId = 0;

CompanyModel myCompanyModel = CompanyModel.empty();
