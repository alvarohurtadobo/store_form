class ExtensionModel {
  int id = 0;
  String name = "";
  ExtensionModel(this.id, this.name);

  String getName() => name;
}

List<ExtensionModel> myExtensions = [
  ExtensionModel(0, "Sel"),
  ExtensionModel(1, "+52"),
  ExtensionModel(2, "+591"),
  ExtensionModel(3, "+1"),
];

int myExtensionId = 1;