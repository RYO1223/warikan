import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warikan/data/model/payment/payment.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class Group with _$Group {
  const Group._();

  const factory Group({
    required String id,
    required String name,
    @Default([]) List<Payment> payments,
  }) = _Group;

  factory Group.fromJson(Map<String, Object?> json) => _$GroupFromJson(json);

  static Group fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    return Group.fromJson(
      snapshot.data()!..['id'] = snapshot.id,
    );
  }

  Map<String, Object?> toFireStore(SetOptions? options) {
    return toJson();
  }
}
