import 'package:warikan/src/shared/classes/payment.dart';
import 'package:warikan/src/shared/providers/payments.dart';

class Group {
  const Group({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  List<Payment> get payments => PaymentsProvider.shared.payments
      .where((payment) => payment.group.id == id)
      .toList();
}
