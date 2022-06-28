import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warikan/data/model/group/group.dart';
import 'package:warikan/data/model/payment/payment.dart';

extension FirestoreConverterExt on CollectionReference {
  CollectionReference<Group> withGroupConverter() {
    return withConverter<Group>(
      fromFirestore: (snapshot, _) => Group.fromJson(
        snapshot.data()!..['id'] = snapshot.id,
      ),
      toFirestore: (model, _) => model.toJson(),
    );
  }

  CollectionReference<Payment> withPaymentConverter(Group group) {
    return withConverter<Payment>(
      fromFirestore: (snapshot, _) => Payment.fromJson(
        snapshot.data()!
          ..['id'] = snapshot.id
          ..['group'] = group.toJson(),
      ),
      toFirestore: (model, _) => model.toJson()
        ..removeWhere((key, value) => ['id', 'group'].contains(key)),
    );
  }
}
