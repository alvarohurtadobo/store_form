class ProductModel {
  int id = 0;
  String name = "";
  ProductModel(this.id, this.name);

  String getName() => name;
}

List<ProductModel> myModels = [
  ProductModel(0, "Modelo"),
  ProductModel(1, "FALKON 200cc"),
  ProductModel(2, "ECLIPSE 150cc"),
  ProductModel(3, "CYCLONE 200cc"),
];

int currentModelId = 0;
