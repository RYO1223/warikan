import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:warikan/src/shared/providers/payments.dart';

class PaymentList extends StatefulWidget {
  const PaymentList({Key? key}) : super(key: key);

  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  PaymentsProvider _paymentsProvider = PaymentsProvider();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _paymentsProvider.payments.map((payment) {
        return ListTile(
          title: Text(payment.name),
          subtitle: Text(payment.money.toString()),
        );
      }).toList(),
    );
  }
}
