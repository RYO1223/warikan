import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warikan/data/model/group/group.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

DateTime fromTimestampToDateTime(Timestamp timestamp) => timestamp.toDate();
Timestamp fromDateTimeToTimestamp(DateTime dateTime) =>
    Timestamp.fromDate(dateTime);

@freezed
class Payment with _$Payment {
  const Payment._();

  const factory Payment({
    required String id,
    required Group group,
    required String name,
    required int price,
    @Default(false)
        bool deleted,
    @JsonKey(
      fromJson: fromTimestampToDateTime,
      toJson: fromDateTimeToTimestamp,
    )
        required DateTime createdAt,
    @JsonKey(
      fromJson: fromTimestampToDateTime,
      toJson: fromDateTimeToTimestamp,
    )
        required DateTime updatedAt,
  }) = _$payment;

  factory Payment.fromJson(Map<String, Object?> json) =>
      _$PaymentFromJson(json);

  static Payment fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
    Group group,
  ) {
    return Payment.fromJson(snapshot.data()!
      ..['id'] = snapshot.id
      ..['group'] = group.toJson()
      ..['createdAt'] = snapshot.data()!['createdAt']);
  }

  Map<String, Object?> toFirestore(SetOptions? options) {
    return toJson()..removeWhere((key, value) => ['id', 'group'].contains(key));
  }
}
