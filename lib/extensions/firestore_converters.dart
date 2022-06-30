import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warikan/data/model/group/group.dart';
import 'package:warikan/data/model/payment/payment.dart';

extension FirestoreConverterExt on CollectionReference {
  CollectionReference<Group> withGroupConverter() {
    return withConverter<Group>(
      fromFirestore: Group.fromFirestore,
      toFirestore: (model, options) => model.toFireStore(options),
    );
  }

  CollectionReference<Payment> withPaymentConverter(Group group) {
    return withConverter<Payment>(
        fromFirestore: (snapshot, options) =>
            Payment.fromFireStore(snapshot, options, group),
        toFirestore: (model, options) => model.toFirestore(options));
  }
}
