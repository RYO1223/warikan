// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _$payment.fromJson(json);
}

/// @nodoc
mixin _$Payment {
  String get id => throw _privateConstructorUsedError;
  Group get group => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromTimestampToDateTime, toJson: fromDateTimeToTimestamp)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromTimestampToDateTime, toJson: fromDateTimeToTimestamp)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res>;
  $Res call(
      {String id,
      Group group,
      String name,
      int price,
      bool deleted,
      @JsonKey(fromJson: fromTimestampToDateTime, toJson: fromDateTimeToTimestamp)
          DateTime createdAt,
      @JsonKey(fromJson: fromTimestampToDateTime, toJson: fromDateTimeToTimestamp)
          DateTime updatedAt});

  $GroupCopyWith<$Res> get group;
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res> implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  final Payment _value;
  // ignore: unused_field
  final $Res Function(Payment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? group = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? deleted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      deleted: deleted == freezed
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $GroupCopyWith<$Res> get group {
    return $GroupCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value));
    });
  }
}

/// @nodoc
abstract class _$$_$paymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$$_$paymentCopyWith(
          _$_$payment value, $Res Function(_$_$payment) then) =
      __$$_$paymentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      Group group,
      String name,
      int price,
      bool deleted,
      @JsonKey(fromJson: fromTimestampToDateTime, toJson: fromDateTimeToTimestamp)
          DateTime createdAt,
      @JsonKey(fromJson: fromTimestampToDateTime, toJson: fromDateTimeToTimestamp)
          DateTime updatedAt});

  @override
  $GroupCopyWith<$Res> get group;
}

/// @nodoc
class __$$_$paymentCopyWithImpl<$Res> extends _$PaymentCopyWithImpl<$Res>
    implements _$$_$paymentCopyWith<$Res> {
  __$$_$paymentCopyWithImpl(
      _$_$payment _value, $Res Function(_$_$payment) _then)
      : super(_value, (v) => _then(v as _$_$payment));

  @override
  _$_$payment get _value => super._value as _$_$payment;

  @override
  $Res call({
    Object? id = freezed,
    Object? group = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? deleted = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_$payment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      deleted: deleted == freezed
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_$payment extends _$payment {
  const _$_$payment(
      {required this.id,
      required this.group,
      required this.name,
      required this.price,
      this.deleted = false,
      @JsonKey(fromJson: fromTimestampToDateTime, toJson: fromDateTimeToTimestamp)
          required this.createdAt,
      @JsonKey(fromJson: fromTimestampToDateTime, toJson: fromDateTimeToTimestamp)
          required this.updatedAt})
      : super._();

  factory _$_$payment.fromJson(Map<String, dynamic> json) =>
      _$$_$paymentFromJson(json);

  @override
  final String id;
  @override
  final Group group;
  @override
  final String name;
  @override
  final int price;
  @override
  @JsonKey()
  final bool deleted;
  @override
  @JsonKey(fromJson: fromTimestampToDateTime, toJson: fromDateTimeToTimestamp)
  final DateTime createdAt;
  @override
  @JsonKey(fromJson: fromTimestampToDateTime, toJson: fromDateTimeToTimestamp)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Payment(id: $id, group: $group, name: $name, price: $price, deleted: $deleted, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_$payment &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.group, group) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.deleted, deleted) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(group),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(deleted),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_$paymentCopyWith<_$_$payment> get copyWith =>
      __$$_$paymentCopyWithImpl<_$_$payment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_$paymentToJson(this);
  }
}

abstract class _$payment extends Payment {
  const factory _$payment(
      {required final String id,
      required final Group group,
      required final String name,
      required final int price,
      final bool deleted,
      @JsonKey(fromJson: fromTimestampToDateTime, toJson: fromDateTimeToTimestamp)
          required final DateTime createdAt,
      @JsonKey(fromJson: fromTimestampToDateTime, toJson: fromDateTimeToTimestamp)
          required final DateTime updatedAt}) = _$_$payment;
  const _$payment._() : super._();

  factory _$payment.fromJson(Map<String, dynamic> json) = _$_$payment.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  Group get group => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get price => throw _privateConstructorUsedError;
  @override
  bool get deleted => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: fromTimestampToDateTime, toJson: fromDateTimeToTimestamp)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: fromTimestampToDateTime, toJson: fromDateTimeToTimestamp)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_$paymentCopyWith<_$_$payment> get copyWith =>
      throw _privateConstructorUsedError;
}
