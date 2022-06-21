import 'package:warikan/src/shared/classes/group.dart';

class Payment {
  const Payment({
    required this.group,
    required this.name,
    required this.money,
  });

  final Group group;
  final String name;
  final int money;
}
