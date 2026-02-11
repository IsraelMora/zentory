class AppConfig {
  static const String appwriteEndpoint = String.fromEnvironment(
    'APPWRITE_ENDPOINT',
    defaultValue: 'https://nyc.cloud.appwrite.io/v1',
  );

  static const String appwriteProjectId = String.fromEnvironment(
    'APPWRITE_PROJECT_ID',
    defaultValue: '698b832900102c51574c',
  );

  static const String appwriteDatabaseId = String.fromEnvironment(
    'APPWRITE_DATABASE_ID',
    defaultValue: '698ccb440022c65acf01',
  );

  static const String productsCollectionId = String.fromEnvironment(
    'PRODUCTS_COLLECTION_ID',
    defaultValue: 'products',
  );

  static const String movementsCollectionId = String.fromEnvironment(
    'MOVEMENTS_COLLECTION_ID',
    defaultValue: 'movements',
  );

  static const String workspacesCollectionId = String.fromEnvironment(
    'WORKSPACES_COLLECTION_ID',
    defaultValue: 'workspaces',
  );

  static const String productImagesBucketId = String.fromEnvironment(
    'PRODUCT_IMAGES_BUCKET_ID',
    defaultValue: 'product_images',
  );
}
