import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @appTitle.
  ///
  /// In es, this message translates to:
  /// **'Zentory'**
  String get appTitle;

  /// No description provided for @inventory.
  ///
  /// In es, this message translates to:
  /// **'Inventario'**
  String get inventory;

  /// No description provided for @inventorySubtitle.
  ///
  /// In es, this message translates to:
  /// **'Gestión de Productos'**
  String get inventorySubtitle;

  /// No description provided for @products.
  ///
  /// In es, this message translates to:
  /// **'Productos'**
  String get products;

  /// No description provided for @confirm.
  ///
  /// In es, this message translates to:
  /// **'Confirmar'**
  String get confirm;

  /// No description provided for @cancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get cancel;

  /// No description provided for @error.
  ///
  /// In es, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In es, this message translates to:
  /// **'Éxito'**
  String get success;

  /// No description provided for @loading.
  ///
  /// In es, this message translates to:
  /// **'Cargando...'**
  String get loading;

  /// No description provided for @retry.
  ///
  /// In es, this message translates to:
  /// **'Reintentar'**
  String get retry;

  /// No description provided for @history.
  ///
  /// In es, this message translates to:
  /// **'Historial'**
  String get history;

  /// No description provided for @team.
  ///
  /// In es, this message translates to:
  /// **'Equipo'**
  String get team;

  /// No description provided for @teamSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Gestión de miembros'**
  String get teamSubtitle;

  /// No description provided for @profile.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get profile;

  /// No description provided for @profileSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Ajustes de cuenta'**
  String get profileSubtitle;

  /// No description provided for @dashboard.
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get dashboard;

  /// No description provided for @dashboardSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Resumen general'**
  String get dashboardSubtitle;

  /// No description provided for @stockAlerts.
  ///
  /// In es, this message translates to:
  /// **'Alertas de Stock'**
  String get stockAlerts;

  /// No description provided for @recentActivity.
  ///
  /// In es, this message translates to:
  /// **'Actividad Reciente'**
  String get recentActivity;

  /// No description provided for @totalItems.
  ///
  /// In es, this message translates to:
  /// **'Items Totales'**
  String get totalItems;

  /// No description provided for @totalStockValue.
  ///
  /// In es, this message translates to:
  /// **'Valor Total'**
  String get totalStockValue;

  /// No description provided for @lowStock.
  ///
  /// In es, this message translates to:
  /// **'Stock Bajo'**
  String get lowStock;

  /// No description provided for @categories.
  ///
  /// In es, this message translates to:
  /// **'Categorías'**
  String get categories;

  /// No description provided for @addProduct.
  ///
  /// In es, this message translates to:
  /// **'Agregar Producto'**
  String get addProduct;

  /// No description provided for @editProduct.
  ///
  /// In es, this message translates to:
  /// **'Editar Producto'**
  String get editProduct;

  /// No description provided for @saveChanges.
  ///
  /// In es, this message translates to:
  /// **'Guardar Cambios'**
  String get saveChanges;

  /// No description provided for @deleteProduct.
  ///
  /// In es, this message translates to:
  /// **'Eliminar Producto'**
  String get deleteProduct;

  /// No description provided for @searchProducts.
  ///
  /// In es, this message translates to:
  /// **'Buscar productos...'**
  String get searchProducts;

  /// No description provided for @noProducts.
  ///
  /// In es, this message translates to:
  /// **'Sin productos'**
  String get noProducts;

  /// No description provided for @noProductsDesc.
  ///
  /// In es, this message translates to:
  /// **'Aún no has agregado nada a tu inventario.'**
  String get noProductsDesc;

  /// No description provided for @addFirstProduct.
  ///
  /// In es, this message translates to:
  /// **'Agregar primer producto'**
  String get addFirstProduct;

  /// No description provided for @stock.
  ///
  /// In es, this message translates to:
  /// **'Stock'**
  String get stock;

  /// No description provided for @price.
  ///
  /// In es, this message translates to:
  /// **'Precio'**
  String get price;

  /// No description provided for @category.
  ///
  /// In es, this message translates to:
  /// **'Categoría'**
  String get category;

  /// No description provided for @offlineMode.
  ///
  /// In es, this message translates to:
  /// **'Modo Offline - Los cambios se sincronizarán pronto'**
  String get offlineMode;

  /// No description provided for @movementInflow.
  ///
  /// In es, this message translates to:
  /// **'Entrada'**
  String get movementInflow;

  /// No description provided for @movementOutflow.
  ///
  /// In es, this message translates to:
  /// **'Salida'**
  String get movementOutflow;

  /// No description provided for @noRecentActivity.
  ///
  /// In es, this message translates to:
  /// **'Sin actividad reciente'**
  String get noRecentActivity;

  /// No description provided for @movementsEmptyDesc.
  ///
  /// In es, this message translates to:
  /// **'Las entradas y salidas de stock aparecerán aquí.'**
  String get movementsEmptyDesc;

  /// No description provided for @unknownUser.
  ///
  /// In es, this message translates to:
  /// **'Usuario desconocido'**
  String get unknownUser;

  /// No description provided for @adjustment.
  ///
  /// In es, this message translates to:
  /// **'Ajuste'**
  String get adjustment;

  /// No description provided for @lowStockWarning.
  ///
  /// In es, this message translates to:
  /// **'Solo quedan {count} unidades'**
  String lowStockWarning(Object count);

  /// No description provided for @deleteProductConfirm.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar producto?'**
  String get deleteProductConfirm;

  /// No description provided for @deleteProductDesc.
  ///
  /// In es, this message translates to:
  /// **'Esta acción no se puede deshacer y eliminará todo el historial de movimientos.'**
  String get deleteProductDesc;

  /// No description provided for @productAdded.
  ///
  /// In es, this message translates to:
  /// **'Producto agregado con éxito'**
  String get productAdded;

  /// No description provided for @productUpdated.
  ///
  /// In es, this message translates to:
  /// **'Producto actualizado'**
  String get productUpdated;

  /// No description provided for @productDeleted.
  ///
  /// In es, this message translates to:
  /// **'Producto eliminado'**
  String get productDeleted;

  /// No description provided for @all.
  ///
  /// In es, this message translates to:
  /// **'Todos'**
  String get all;

  /// No description provided for @search.
  ///
  /// In es, this message translates to:
  /// **'Buscar'**
  String get search;

  /// No description provided for @addPhoto.
  ///
  /// In es, this message translates to:
  /// **'Añadir foto'**
  String get addPhoto;

  /// No description provided for @productName.
  ///
  /// In es, this message translates to:
  /// **'Nombre del producto'**
  String get productName;

  /// No description provided for @descriptionOptional.
  ///
  /// In es, this message translates to:
  /// **'Descripción (opcional)'**
  String get descriptionOptional;

  /// No description provided for @createProduct.
  ///
  /// In es, this message translates to:
  /// **'Crear Producto'**
  String get createProduct;

  /// No description provided for @workspaces.
  ///
  /// In es, this message translates to:
  /// **'Espacios de Trabajo'**
  String get workspaces;

  /// No description provided for @newWorkspace.
  ///
  /// In es, this message translates to:
  /// **'Nuevo Espacio'**
  String get newWorkspace;

  /// No description provided for @workspaceName.
  ///
  /// In es, this message translates to:
  /// **'Nombre del espacio'**
  String get workspaceName;

  /// No description provided for @workspaceNameHint.
  ///
  /// In es, this message translates to:
  /// **'Ej: Almacén Principal'**
  String get workspaceNameHint;

  /// No description provided for @createWorkspace.
  ///
  /// In es, this message translates to:
  /// **'Crear Espacio'**
  String get createWorkspace;

  /// No description provided for @noMembers.
  ///
  /// In es, this message translates to:
  /// **'Sin miembros'**
  String get noMembers;

  /// No description provided for @noMembersDesc.
  ///
  /// In es, this message translates to:
  /// **'Invita a tu equipo para empezar a colaborar.'**
  String get noMembersDesc;

  /// No description provided for @inviteMember.
  ///
  /// In es, this message translates to:
  /// **'Invitar Miembro'**
  String get inviteMember;

  /// No description provided for @email.
  ///
  /// In es, this message translates to:
  /// **'Correo electrónico'**
  String get email;

  /// No description provided for @emailHint.
  ///
  /// In es, this message translates to:
  /// **'ejemplo@correo.com'**
  String get emailHint;

  /// No description provided for @role.
  ///
  /// In es, this message translates to:
  /// **'Rol'**
  String get role;

  /// No description provided for @sendInvitation.
  ///
  /// In es, this message translates to:
  /// **'Enviar Invitación'**
  String get sendInvitation;

  /// No description provided for @logout.
  ///
  /// In es, this message translates to:
  /// **'Cerrar Sesión'**
  String get logout;

  /// No description provided for @logoutConfirm.
  ///
  /// In es, this message translates to:
  /// **'¿Cerrar Sesión?'**
  String get logoutConfirm;

  /// No description provided for @logoutDesc.
  ///
  /// In es, this message translates to:
  /// **'¿Estás seguro de que deseas cerrar sesión?'**
  String get logoutDesc;

  /// No description provided for @letsGetStarted.
  ///
  /// In es, this message translates to:
  /// **'¡Comencemos!'**
  String get letsGetStarted;

  /// No description provided for @letsGetStartedDesc.
  ///
  /// In es, this message translates to:
  /// **'Crea tu primer espacio de trabajo para comenzar a gestionar tu inventario.'**
  String get letsGetStartedDesc;

  /// No description provided for @errorLoadingWorkspaces.
  ///
  /// In es, this message translates to:
  /// **'Error al cargar espacios'**
  String get errorLoadingWorkspaces;

  /// No description provided for @members.
  ///
  /// In es, this message translates to:
  /// **'miembros'**
  String get members;

  /// No description provided for @yourWorkspaces.
  ///
  /// In es, this message translates to:
  /// **'Tus Espacios'**
  String get yourWorkspaces;

  /// No description provided for @notifications.
  ///
  /// In es, this message translates to:
  /// **'Notificaciones'**
  String get notifications;

  /// No description provided for @allCaughtUp.
  ///
  /// In es, this message translates to:
  /// **'Todo al día'**
  String get allCaughtUp;

  /// No description provided for @allCaughtUpDesc.
  ///
  /// In es, this message translates to:
  /// **'No tienes notificaciones pendientes.'**
  String get allCaughtUpDesc;

  /// No description provided for @editName.
  ///
  /// In es, this message translates to:
  /// **'Editar Nombre'**
  String get editName;

  /// No description provided for @fullName.
  ///
  /// In es, this message translates to:
  /// **'Nombre Completo'**
  String get fullName;

  /// No description provided for @save.
  ///
  /// In es, this message translates to:
  /// **'Guardar'**
  String get save;

  /// No description provided for @changePassword.
  ///
  /// In es, this message translates to:
  /// **'Cambiar Contraseña'**
  String get changePassword;

  /// No description provided for @currentPassword.
  ///
  /// In es, this message translates to:
  /// **'Contraseña Actual'**
  String get currentPassword;

  /// No description provided for @newPassword.
  ///
  /// In es, this message translates to:
  /// **'Nueva Contraseña'**
  String get newPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In es, this message translates to:
  /// **'Confirmar Contraseña'**
  String get confirmPassword;

  /// No description provided for @update.
  ///
  /// In es, this message translates to:
  /// **'Actualizar'**
  String get update;

  /// No description provided for @themeAndAppearance.
  ///
  /// In es, this message translates to:
  /// **'Tema y Apariencia'**
  String get themeAndAppearance;

  /// No description provided for @automaticSystem.
  ///
  /// In es, this message translates to:
  /// **'Automático (Sistema)'**
  String get automaticSystem;

  /// No description provided for @lightMode.
  ///
  /// In es, this message translates to:
  /// **'Modo Claro'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In es, this message translates to:
  /// **'Modo Oscuro'**
  String get darkMode;

  /// No description provided for @close.
  ///
  /// In es, this message translates to:
  /// **'Cerrar'**
  String get close;

  /// No description provided for @loadingProfile.
  ///
  /// In es, this message translates to:
  /// **'Cargando perfil...'**
  String get loadingProfile;

  /// No description provided for @password.
  ///
  /// In es, this message translates to:
  /// **'Contraseña'**
  String get password;

  /// No description provided for @logoutDescAlt.
  ///
  /// In es, this message translates to:
  /// **'¿Estás seguro de que quieres salir?'**
  String get logoutDescAlt;

  /// No description provided for @login.
  ///
  /// In es, this message translates to:
  /// **'Iniciar Sesión'**
  String get login;

  /// No description provided for @createAccount.
  ///
  /// In es, this message translates to:
  /// **'Crear Cuenta'**
  String get createAccount;

  /// No description provided for @fullNameHint.
  ///
  /// In es, this message translates to:
  /// **'Ej. Juan Pérez'**
  String get fullNameHint;

  /// No description provided for @emailPlaceholder.
  ///
  /// In es, this message translates to:
  /// **'nombre@ejemplo.com'**
  String get emailPlaceholder;

  /// No description provided for @passwordPlaceholder.
  ///
  /// In es, this message translates to:
  /// **'••••••••'**
  String get passwordPlaceholder;

  /// No description provided for @welcomeBack.
  ///
  /// In es, this message translates to:
  /// **'Bienvenido'**
  String get welcomeBack;

  /// No description provided for @joinZentory.
  ///
  /// In es, this message translates to:
  /// **'Únete a Zentory'**
  String get joinZentory;

  /// No description provided for @manageEverything.
  ///
  /// In es, this message translates to:
  /// **'Gestiona todo desde un solo lugar.'**
  String get manageEverything;

  /// No description provided for @createAccountInSeconds.
  ///
  /// In es, this message translates to:
  /// **'Crea tu cuenta en segundos.'**
  String get createAccountInSeconds;

  /// No description provided for @dontHaveAccount.
  ///
  /// In es, this message translates to:
  /// **'¿No tienes cuenta?'**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In es, this message translates to:
  /// **'¿Ya tienes una cuenta?'**
  String get alreadyHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In es, this message translates to:
  /// **'Regístrate'**
  String get signUp;

  /// No description provided for @logIn.
  ///
  /// In es, this message translates to:
  /// **'Inicia Sesión'**
  String get logIn;

  /// No description provided for @fieldRequired.
  ///
  /// In es, this message translates to:
  /// **'Campo requerido'**
  String get fieldRequired;

  /// No description provided for @minCharacters.
  ///
  /// In es, this message translates to:
  /// **'Mínimo 8 caracteres'**
  String get minCharacters;

  /// No description provided for @doesNotMatch.
  ///
  /// In es, this message translates to:
  /// **'No coincide'**
  String get doesNotMatch;

  /// No description provided for @passwordUpdated.
  ///
  /// In es, this message translates to:
  /// **'Contraseña actualizada'**
  String get passwordUpdated;

  /// No description provided for @appVersion.
  ///
  /// In es, this message translates to:
  /// **'Zentory v1.0.0'**
  String get appVersion;

  /// No description provided for @connectionError.
  ///
  /// In es, this message translates to:
  /// **'No pudimos conectar con el servidor. Verifica tu conexión e intenta nuevamente.'**
  String get connectionError;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return L10nEn();
    case 'es':
      return L10nEs();
  }

  throw FlutterError(
      'L10n.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
