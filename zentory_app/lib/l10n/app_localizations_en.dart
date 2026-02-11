// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Zentory';

  @override
  String get inventory => 'Inventory';

  @override
  String get history => 'History';

  @override
  String get team => 'Team';

  @override
  String get profile => 'Profile';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get addProduct => 'Add Product';

  @override
  String get editProduct => 'Edit Product';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get deleteProduct => 'Delete Product';

  @override
  String get searchProducts => 'Search products...';

  @override
  String get noProducts => 'No products';

  @override
  String get noProductsDesc =>
      'You haven\'t added anything to your inventory yet.';

  @override
  String get addFirstProduct => 'Add first product';

  @override
  String get stock => 'Stock';

  @override
  String get price => 'Price';

  @override
  String get category => 'Category';

  @override
  String get offlineMode => 'Offline Mode - Changes will be synced soon';
}
