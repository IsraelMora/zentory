enum ProductCategory {
  general('General'),
  food('Alimentos'),
  beverages('Bebidas'),
  cleaning('Limpieza'),
  electronics('Electrónica'),
  home('Hogar');

  final String displayName;

  const ProductCategory(this.displayName);

  static ProductCategory fromString(String value) {
    return ProductCategory.values.firstWhere(
      (category) => category.displayName == value,
      orElse: () => ProductCategory.general,
    );
  }

  static List<String> get displayNames =>
      ProductCategory.values.map((c) => c.displayName).toList();
}
