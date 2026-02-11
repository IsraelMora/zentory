// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class L10nEs extends L10n {
  L10nEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Zentory';

  @override
  String get inventory => 'Inventario';

  @override
  String get history => 'Historial';

  @override
  String get team => 'Equipo';

  @override
  String get profile => 'Perfil';

  @override
  String get dashboard => 'Inicio';

  @override
  String get addProduct => 'Agregar Producto';

  @override
  String get editProduct => 'Editar Producto';

  @override
  String get saveChanges => 'Guardar Cambios';

  @override
  String get deleteProduct => 'Eliminar Producto';

  @override
  String get searchProducts => 'Buscar productos...';

  @override
  String get noProducts => 'Sin productos';

  @override
  String get noProductsDesc => 'Aún no has agregado nada a tu inventario.';

  @override
  String get addFirstProduct => 'Agregar primer producto';

  @override
  String get stock => 'Stock';

  @override
  String get price => 'Precio';

  @override
  String get category => 'Categoría';

  @override
  String get offlineMode =>
      'Modo Offline - Los cambios se sincronizarán pronto';
}
