class Person {
  int id = 0;
  String name = '';
  String firstLastName = '';
  String secondLastName = '';
  String civilStatus = '';
  String marriageType = '';
  String email = '';
  String password = '';
  UserType type;
  String phoneNumber = '';
  String gender = '';
  DateTime? birthday;
  int age = 0;
  String nationality = '';
  String rfc = '';
  int? dependents;
  String homePhoneNumber = '';
  int addressId = 0;
  int companyId = 0;
  double monthlyIncome = 0.0;
  double initialDownPaymentAmount = 0.0;
  double monthlyOutcome = 0.0;
  String initialDownPaymentMethod = '';
  int referee1Id = 0;
  int referee2Id = 0;
  int referee3Id = 0;
  String idPictureUrl = '';
  String proofOfAddressPictureUrl = '';
  bool hasDebitCreditCard = false;
  int prospectId = 0;
  String verificationCode = '';
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  Map<String, dynamic> toJsonFirstEndpoint() {
    return {
      "name": name,
      "first_last_name": firstLastName,
      "second_last_name": secondLastName,
      "civil_status": civilStatus,
      "marriage_type": marriageType,
      "email": email,
      "type": 'LEAD',
      "phone_number": phoneNumber,
      "gender": gender,
      "birthday": birthday!.toIso8601String(),
      "age": DateTime.now().difference(birthday!).inHours / 24 ~/ 365,
      "nationality": nationality,
      "rfc": rfc,
      "dependents": dependents,
      "home_phone_number": phoneNumber
    };
  }

  Map<String, dynamic> toJsonSecondEndpoint() {
    return {
      "monthly_income": monthlyIncome,
      "monthly_outcome": monthlyOutcome,
      "initial_down_payment_method": initialDownPaymentMethod,
      "initial_down_payment_amount": initialDownPaymentAmount
    };
  }

  bool isReadyForPage2() {
    if (name == "" ||
        firstLastName == "" ||
        secondLastName == "" ||
        homePhoneNumber == "" ||
        phoneNumber == "" ||
        email == "" ||
        gender == '' ||
        birthday == null ||
        dependents == null ||
        civilStatus == '' ||
        nationality == "" ||
        marriageType == "") {
      return false;
    }
    return true;
  }

  bool isReadyForPage5() {
    if (monthlyIncome == 0 ||
        monthlyOutcome == 0 ||
        initialDownPaymentMethod == '' ||
        initialDownPaymentAmount == 0) {
      return false;
    }
    return true;
  }

  Person.empty({
    this.marriageType = '',
    this.type = UserType.LEAD,
    this.gender = '',
    this.nationality = '',
  });

  Person(
      {this.id = 0,
      this.name = '',
      this.firstLastName = '',
      this.secondLastName = '',
      this.civilStatus = '',
      this.marriageType = '',
      this.email = '',
      this.password = '',
      this.type = UserType.LEAD,
      this.phoneNumber = '',
      this.gender = '',
      this.birthday,
      this.age = 0,
      this.nationality = '',
      this.rfc = '',
      this.dependents,
      this.homePhoneNumber = '',
      this.addressId = 0,
      this.companyId = 0,
      this.monthlyIncome = 0.0,
      this.initialDownPaymentAmount = 0.0,
      this.monthlyOutcome = 0.0,
      this.initialDownPaymentMethod = '',
      this.referee1Id = 0,
      this.referee2Id = 0,
      this.referee3Id = 0,
      this.idPictureUrl = '',
      this.proofOfAddressPictureUrl = '',
      this.hasDebitCreditCard = false,
      this.prospectId = 0,
      this.verificationCode = ''});
}

enum MarriageType { COMMUNITY_PROPERTY, SEPARATE_PROPERTY, FREE_UNION, OTHER }

enum UserType { LEAD, ENGANCHED, ACTIVE, PAID }

enum Gender {
  MALE,
  FEMALE,
  OTHER,
}

enum Nationality { MEXICAN, FOREIGN }

Person myCurrentPerson = Person.empty();

class InitialPaymentMethod {
  // Define the structure and properties of the InitialPaymentMethod class
  int id = 0;
  String name = "";
  String displayName = "";
  InitialPaymentMethod(this.id, this.name, this.displayName);
  InitialPaymentMethod.empty();
  String getName() => displayName;
  // EMPLOYEE
  // OFFICIAL
  // EXECUTIVE
  // PARTNER
  // INDEPENDENT
  // PENSIONARY
  // OTHER
}

List<InitialPaymentMethod> myInitialPaymentMethods = [
  InitialPaymentMethod(0, "", "Método de pago del enganche"),
  InitialPaymentMethod(1, "CASH", "Efectivo"),
  InitialPaymentMethod(2, "DEBIT", "Tarjeta de Débito"),
  InitialPaymentMethod(3, "CREDIT", "Tarjeta de Crédito"),
];

int myInitialPaymentMethodId = 0;
