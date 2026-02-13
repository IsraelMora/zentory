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
  String get inventorySubtitle => 'Product Management';

  @override
  String get products => 'Products';

  @override
  String get confirm => 'Confirm';

  @override
  String get cancel => 'Cancel';

  @override
  String get error => 'Error';

  @override
  String get success => 'Success';

  @override
  String get loading => 'Loading...';

  @override
  String get retry => 'Retry';

  @override
  String get history => 'History';

  @override
  String get team => 'Team';

  @override
  String get teamSubtitle => 'Manage members';

  @override
  String get profile => 'Profile';

  @override
  String get profileSubtitle => 'Account settings';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get dashboardSubtitle => 'General summary';

  @override
  String get stockAlerts => 'Stock Alerts';

  @override
  String get recentActivity => 'Recent Activity';

  @override
  String get totalItems => 'Total Items';

  @override
  String get totalStockValue => 'Total Value';

  @override
  String get lowStock => 'Low Stock';

  @override
  String get categories => 'Categories';

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

  @override
  String get movementInflow => 'Inflow';

  @override
  String get movementOutflow => 'Outflow';

  @override
  String get noRecentActivity => 'No recent activity';

  @override
  String get movementsEmptyDesc =>
      'Stock inflows and outflows will appear here.';

  @override
  String get unknownUser => 'Unknown User';

  @override
  String get adjustment => 'Adjustment';

  @override
  String lowStockWarning(Object count) {
    return 'Only $count units left';
  }

  @override
  String get deleteProductConfirm => 'Delete product?';

  @override
  String get deleteProductDesc =>
      'This action cannot be undone and will delete all movement history.';

  @override
  String get productAdded => 'Product added successfully';

  @override
  String get productUpdated => 'Product updated';

  @override
  String get productDeleted => 'Product deleted';

  @override
  String get all => 'All';

  @override
  String get search => 'Search';

  @override
  String get addPhoto => 'Add photo';

  @override
  String get productName => 'Product Name';

  @override
  String get descriptionOptional => 'Description (optional)';

  @override
  String get createProduct => 'Create Product';

  @override
  String get workspaces => 'Espacios de Trabajo';

  @override
  String get newWorkspace => 'Nuevo Espacio';

  @override
  String get workspaceName => 'Nombre del espacio';

  @override
  String get workspaceNameHint => 'Ej: Almacén Principal';

  @override
  String get createWorkspace => 'Crear Espacio';

  @override
  String get noMembers => 'Sin miembros';

  @override
  String get noMembersDesc => 'Invita a tu equipo para empezar a colaborar.';

  @override
  String get inviteMember => 'Invitar Miembro';

  @override
  String get email => 'Correo electrónico';

  @override
  String get emailHint => 'ejemplo@correo.com';

  @override
  String get role => 'Rol';

  @override
  String get sendInvitation => 'Enviar Invitación';

  @override
  String get logout => 'Cerrar Sesión';

  @override
  String get logoutConfirm => '¿Cerrar Sesión?';

  @override
  String get logoutDesc => '¿Estás seguro de que deseas cerrar sesión?';

  @override
  String get letsGetStarted => '¡Comencemos!';

  @override
  String get letsGetStartedDesc =>
      'Crea tu primer espacio de trabajo para comenzar a gestionar tu inventario.';

  @override
  String get errorLoadingWorkspaces => 'Error al cargar espacios';

  @override
  String get members => 'miembros';

  @override
  String get yourWorkspaces => 'Tus Espacios';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get allCaughtUp => 'Todo al día';

  @override
  String get allCaughtUpDesc => 'No tienes notificaciones pendientes.';

  @override
  String get editName => 'Editar Nombre';

  @override
  String get fullName => 'Nombre Completo';

  @override
  String get save => 'Guardar';

  @override
  String get changePassword => 'Cambiar Contraseña';

  @override
  String get currentPassword => 'Contraseña Actual';

  @override
  String get newPassword => 'Nueva Contraseña';

  @override
  String get confirmPassword => 'Confirmar Contraseña';

  @override
  String get update => 'Actualizar';

  @override
  String get themeAndAppearance => 'Tema y Apariencia';

  @override
  String get automaticSystem => 'Automático (Sistema)';

  @override
  String get lightMode => 'Modo Claro';

  @override
  String get darkMode => 'Modo Oscuro';

  @override
  String get close => 'Cerrar';

  @override
  String get loadingProfile => 'Cargando perfil...';

  @override
  String get password => 'Contraseña';

  @override
  String get logoutDescAlt => '¿Estás seguro de que quieres salir?';

  @override
  String get login => 'Iniciar Sesión';

  @override
  String get createAccount => 'Crear Cuenta';

  @override
  String get fullNameHint => 'Ej. Juan Pérez';

  @override
  String get emailPlaceholder => 'nombre@ejemplo.com';

  @override
  String get passwordPlaceholder => '••••••••';
}
