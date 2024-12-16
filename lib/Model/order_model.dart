import 'package:json_annotation/json_annotation.dart';
part 'order_model.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class OrderModel {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "category")
  String? category;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "brand")
  String? brand;

@JsonKey(name: "address")
  String? address;

  @JsonKey(name: "userId")
  String? userId;

  @JsonKey(name: "offer")
  bool? offer;
  

  OrderModel({
    this.id,
    this.name,
    this.description,
    this.category,
    this.image,
    this.offer,
    this.price,
    this.brand,
    this.address,
    this.userId
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
