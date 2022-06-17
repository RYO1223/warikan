import 'package:warikan/src/shared/classes/payment.dart';

class PaymentsProvider {
  List<Payment> get payments => const [
        Payment(
          id: 1,
          name: '焼肉',
          money: 10000,
        ),
        Payment(
          id: 2,
          name: 'ラーメン',
          money: 2000,
        ),
        Payment(
          id: 3,
          name: 'カレー',
          money: 3000,
        )
      ];
}
