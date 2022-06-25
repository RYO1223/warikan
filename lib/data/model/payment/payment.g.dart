// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_$payment _$$_$paymentFromJson(Map<String, dynamic> json) => _$_$payment(
      id: json['id'] as String,
      group: Group.fromJson(json['group'] as Map<String, dynamic>),
      name: json['name'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$$_$paymentToJson(_$_$payment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group': instance.group,
      'name': instance.name,
      'price': instance.price,
    };
