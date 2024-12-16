// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      offer: json['offer'] as bool?,
      price: (json['price'] as num?)?.toDouble(),
      brand: json['brand'] as String?,
      address: json['address'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'price': instance.price,
      'brand': instance.brand,
      'address': instance.address,
      'userId': instance.userId,
      'offer': instance.offer,
    };
