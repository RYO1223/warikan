import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/data/model/group/group.dart';
import 'package:warikan/data/model/payment/payment.dart';
import 'package:warikan/data/repository/payments/payments_repository.dart';

final paymentsRepositoryProvider = Provider<PaymentsRepositoryProviderImpl>(
    (ref) => PaymentsRepositoryProviderImpl(ref: ref));

class PaymentsRepositoryProviderImpl implements PaymentsRepository {
  PaymentsRepositoryProviderImpl({required this.ref});

  final ProviderRef<PaymentsRepositoryProviderImpl> ref;

  @override
  CollectionReference<Payment> getPaymentsRef(Group group) {
    return FirebaseFirestore.instance
        .collection('groups')
        .doc(group.id)
        .collection('payments')
        .withConverter<Payment>(
          fromFirestore: (snapshot, _) =>
              Payment.fromJson(snapshot.data()!..['id'] = snapshot.id),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  @override
  Future<List<Payment>> fetch(Group group) async {
    return getPaymentsRef(group).get().then((payments) {
      return payments.docs.map((doc) => doc.data()).toList();
    });
  }
}
