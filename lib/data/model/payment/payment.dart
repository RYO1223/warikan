import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warikan/data/model/group/group.dart';

part 'payment.freezed.dart';

@freezed
class Payment with _$Payment {
  const factory Payment({
    required String id,
    required Group group,
    required String name,
    required int price,
  }) = _$payment;

  factory Payment.fromJson(Map<String, Object?> json) =>
      _$PaymentFromJson(json);
}
