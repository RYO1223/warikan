import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:warikan/data/model/group/group.dart';
import 'package:warikan/data/model/payment/payment.dart';

abstract class PaymentsRepository {
  CollectionReference<Payment> getPaymentsRef(Group group);
  Future<List<Payment>> fetch(Group group);
  Future addPayment(Payment payment);
  Future editPayment(Payment payment);
}
