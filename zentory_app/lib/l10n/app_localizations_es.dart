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
  String get inventorySubtitle => 'Gestión de Productos';

  @override
  String get products => 'Productos';

  @override
  String get confirm => 'Confirmar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get error => 'Error';

  @override
  String get success => 'Éxito';

  @override
  String get loading => 'Cargando...';

  @override
  String get retry => 'Reintentar';

  @override
  String get history => 'Historial';

  @override
  String get team => 'Equipo';

  @override
  String get teamSubtitle => 'Gestión de miembros';

  @override
  String get profile => 'Perfil';

  @override
  String get profileSubtitle => 'Ajustes de cuenta';

  @override
  String get dashboard => 'Inicio';

  @override
  String get dashboardSubtitle => 'Resumen general';

  @override
  String get stockAlerts => 'Alertas de Stock';

  @override
  String get recentActivity => 'Actividad Reciente';

  @override
  String get totalItems => 'Items Totales';

  @override
  String get totalStockValue => 'Valor Total';

  @override
  String get lowStock => 'Stock Bajo';

  @override
  String get categories => 'Categorías';

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

  @override
  String get movementInflow => 'Entrada';

  @override
  String get movementOutflow => 'Salida';

  @override
  String get noRecentActivity => 'Sin actividad reciente';

  @override
  String get movementsEmptyDesc =>
      'Las entradas y salidas de stock aparecerán aquí.';

  @override
  String get unknownUser => 'Usuario desconocido';

  @override
  String get adjustment => 'Ajuste';

  @override
  String lowStockWarning(Object count) {
    return 'Solo quedan $count unidades';
  }

  @override
  String get deleteProductConfirm => '¿Eliminar producto?';

  @override
  String get deleteProductDesc =>
      'Esta acción no se puede deshacer y eliminará todo el historial de movimientos.';

  @override
  String get productAdded => 'Producto agregado con éxito';

  @override
  String get productUpdated => 'Producto actualizado';

  @override
  String get productDeleted => 'Producto eliminado';

  @override
  String get all => 'Todos';

  @override
  String get search => 'Buscar';

  @override
  String get addPhoto => 'Añadir foto';

  @override
  String get productName => 'Nombre del producto';

  @override
  String get descriptionOptional => 'Descripción (opcional)';

  @override
  String get createProduct => 'Crear Producto';

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

  @override
  String get welcomeBack => 'Bienvenido';

  @override
  String get joinZentory => 'Únete a Zentory';

  @override
  String get manageEverything => 'Gestiona todo desde un solo lugar.';

  @override
  String get createAccountInSeconds => 'Crea tu cuenta en segundos.';

  @override
  String get dontHaveAccount => '¿No tienes cuenta?';

  @override
  String get alreadyHaveAccount => '¿Ya tienes una cuenta?';

  @override
  String get signUp => 'Regístrate';

  @override
  String get logIn => 'Inicia Sesión';

  @override
  String get fieldRequired => 'Campo requerido';

  @override
  String get minCharacters => 'Mínimo 8 caracteres';

  @override
  String get doesNotMatch => 'No coincide';

  @override
  String get passwordUpdated => 'Contraseña actualizada';

  @override
  String get appVersion => 'Zentory v1.0.0';
}
