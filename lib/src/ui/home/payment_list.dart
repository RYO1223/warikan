import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:warikan/src/shared/classes/group.dart';
import 'package:warikan/src/shared/providers/groups.dart';
import 'package:warikan/src/shared/providers/payments.dart';

class PaymentList extends StatefulWidget {
  const PaymentList({Key? key, required this.group}) : super(key: key);

  final Group group;

  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.group.payments.map((payment) {
        return ListTile(
          title: Text(payment.name),
          subtitle: Text(payment.money.toString()),
        );
      }).toList(),
    );
  }
}
