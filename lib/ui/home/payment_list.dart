import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/data/model/group/group.dart';

class PaymentList extends ConsumerWidget {
  const PaymentList({Key? key, required this.group}) : super(key: key);

  final Group group;

  @override
  Widget build(context, ref) {
    return ListView(
      children: group.payments.map((payment) {
        return ListTile(
          title: Text(payment.name),
          subtitle: Text(payment.price.toString()),
        );
      }).toList(),
    );
  }
}
