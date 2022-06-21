import 'package:warikan/src/shared/classes/payment.dart';
import 'package:warikan/src/shared/providers/groups.dart';

class PaymentsProvider {
  static PaymentsProvider get shared => PaymentsProvider();

  List<Payment> get payments => [
        Payment(
          group: GroupsProvider.shared.getGroup(1),
          name: '焼肉',
          money: 10000,
        ),
        Payment(
          group: GroupsProvider.shared.getGroup(2),
          name: 'ラーメン',
          money: 2000,
        ),
        Payment(
          group: GroupsProvider.shared.getGroup(3),
          name: 'カレー',
          money: 3000,
        ),
        Payment(
          group: GroupsProvider.shared.getGroup(1),
          name: '寿司',
          money: 10000,
        ),
        Payment(
          group: GroupsProvider.shared.getGroup(2),
          name: 'ホテル',
          money: 20000,
        ),
        Payment(
          group: GroupsProvider.shared.getGroup(3),
          name: '旅館',
          money: 30000,
        )
      ];
}
