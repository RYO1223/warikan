import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warikan/data/model/payment/payment.dart';

part 'group.freezed.dart';

@freezed
class Group with _$Group {
  const factory Group({
    required String id,
    required String name,
    @Default([]) List<Payment> payments,
  }) = _Group;

  factory Group.fromJson(Map<String, Object?> json) => _$GroupFromJson(json);
}
