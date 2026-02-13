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
  String get workspaces => 'Workspaces';

  @override
  String get newWorkspace => 'New Workspace';

  @override
  String get workspaceName => 'Workspace name';

  @override
  String get workspaceNameHint => 'Ex: Main Warehouse';

  @override
  String get createWorkspace => 'Create Workspace';

  @override
  String get noMembers => 'No members';

  @override
  String get noMembersDesc => 'Invite your team to start collaborating.';

  @override
  String get inviteMember => 'Invite Member';

  @override
  String get email => 'Email';

  @override
  String get emailHint => 'example@email.com';

  @override
  String get role => 'Role';

  @override
  String get sendInvitation => 'Send Invitation';

  @override
  String get logout => 'Log Out';

  @override
  String get logoutConfirm => 'Log Out?';

  @override
  String get logoutDesc => 'Are you sure you want to log out?';

  @override
  String get letsGetStarted => 'Let\'s Get Started!';

  @override
  String get letsGetStartedDesc =>
      'Create your first workspace to start managing your inventory.';

  @override
  String get errorLoadingWorkspaces => 'Error loading workspaces';

  @override
  String get members => 'members';

  @override
  String get yourWorkspaces => 'Your Workspaces';

  @override
  String get notifications => 'Notifications';

  @override
  String get allCaughtUp => 'All Caught Up';

  @override
  String get allCaughtUpDesc => 'You have no pending notifications.';

  @override
  String get editName => 'Edit Name';

  @override
  String get fullName => 'Full Name';

  @override
  String get save => 'Save';

  @override
  String get changePassword => 'Change Password';

  @override
  String get currentPassword => 'Current Password';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get update => 'Update';

  @override
  String get themeAndAppearance => 'Theme and Appearance';

  @override
  String get automaticSystem => 'Automatic (System)';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get close => 'Close';

  @override
  String get loadingProfile => 'Loading profile...';

  @override
  String get password => 'Password';

  @override
  String get logoutDescAlt => 'Are you sure you want to exit?';

  @override
  String get login => 'Log In';

  @override
  String get createAccount => 'Create Account';

  @override
  String get fullNameHint => 'Ex. John Doe';

  @override
  String get emailPlaceholder => 'name@example.com';

  @override
  String get passwordPlaceholder => '••••••••';

  @override
  String get welcomeBack => 'Welcome';

  @override
  String get joinZentory => 'Join Zentory';

  @override
  String get manageEverything => 'Manage everything from one place.';

  @override
  String get createAccountInSeconds => 'Create your account in seconds.';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get logIn => 'Log In';

  @override
  String get fieldRequired => 'Required field';

  @override
  String get minCharacters => 'Minimum 8 characters';

  @override
  String get doesNotMatch => 'Does not match';

  @override
  String get passwordUpdated => 'Password updated';

  @override
  String get appVersion => 'Zentory v1.0.0';
}
