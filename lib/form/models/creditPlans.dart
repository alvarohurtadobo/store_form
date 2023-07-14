class CreditPlan {
  int id = 0;
  String name = "";
  CreditPlan(this.id, this.name);

  String getName() => name;
}

List<CreditPlan> myPlans = [
  CreditPlan(0, "Plan de Crédito"),
  CreditPlan(1, "104 pagos semanales"),
  CreditPlan(2, "52 pagos semanales"),
];

int currentPlanId = 0;
