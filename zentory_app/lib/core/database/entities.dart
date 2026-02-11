import 'package:objectbox/objectbox.dart';

@Entity()
class ProductLocal {
  @Id()
  int id = 0;

  @Index()
  String remoteId;

  String workspaceId;
  String name;
  String description;
  double price;
  int stock;
  String? imageUrl;

  String? category;
  DateTime lastSync;
  bool isPendingSync = false;

  ProductLocal({
    required this.remoteId,
    required this.workspaceId,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    this.imageUrl,
    this.category,
    required this.lastSync,
    this.isPendingSync = false,
  });
}

@Entity()
class MovementLocal {
  @Id()
  int id = 0;

  @Index()
  String remoteId;

  String workspaceId;
  String productId;
  String productName;
  double quantity;
  String type;
  String? reason;
  String createdBy;
  DateTime createdAt;
  bool isPendingSync = false;

  MovementLocal({
    required this.remoteId,
    required this.workspaceId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.type,
    this.reason,
    required this.createdBy,
    required this.createdAt,
    this.isPendingSync = false,
  });
}
