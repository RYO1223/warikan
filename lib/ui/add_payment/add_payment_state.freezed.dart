// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddPaymentState {
  String get name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddPaymentStateCopyWith<AddPaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPaymentStateCopyWith<$Res> {
  factory $AddPaymentStateCopyWith(
          AddPaymentState value, $Res Function(AddPaymentState) then) =
      _$AddPaymentStateCopyWithImpl<$Res>;
  $Res call({String name, String price});
}

/// @nodoc
class _$AddPaymentStateCopyWithImpl<$Res>
    implements $AddPaymentStateCopyWith<$Res> {
  _$AddPaymentStateCopyWithImpl(this._value, this._then);

  final AddPaymentState _value;
  // ignore: unused_field
  final $Res Function(AddPaymentState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AddPaymentStateCopyWith<$Res>
    implements $AddPaymentStateCopyWith<$Res> {
  factory _$$_AddPaymentStateCopyWith(
          _$_AddPaymentState value, $Res Function(_$_AddPaymentState) then) =
      __$$_AddPaymentStateCopyWithImpl<$Res>;
  @override
  $Res call({String name, String price});
}

/// @nodoc
class __$$_AddPaymentStateCopyWithImpl<$Res>
    extends _$AddPaymentStateCopyWithImpl<$Res>
    implements _$$_AddPaymentStateCopyWith<$Res> {
  __$$_AddPaymentStateCopyWithImpl(
      _$_AddPaymentState _value, $Res Function(_$_AddPaymentState) _then)
      : super(_value, (v) => _then(v as _$_AddPaymentState));

  @override
  _$_AddPaymentState get _value => super._value as _$_AddPaymentState;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_$_AddPaymentState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddPaymentState implements _AddPaymentState {
  const _$_AddPaymentState({this.name = '', this.price = ''});

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String price;

  @override
  String toString() {
    return 'AddPaymentState(name: $name, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddPaymentState &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$$_AddPaymentStateCopyWith<_$_AddPaymentState> get copyWith =>
      __$$_AddPaymentStateCopyWithImpl<_$_AddPaymentState>(this, _$identity);
}

abstract class _AddPaymentState implements AddPaymentState {
  const factory _AddPaymentState({final String name, final String price}) =
      _$_AddPaymentState;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get price => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AddPaymentStateCopyWith<_$_AddPaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}