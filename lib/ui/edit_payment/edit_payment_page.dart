import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/data/model/payment/payment.dart';
import 'package:warikan/ui/edit_payment/edit_payment_view_model.dart';

class EditPaymentPage extends HookConsumerWidget {
  const EditPaymentPage({
    Key? key,
    required this.payment,
  }) : super(key: key);

  final Payment payment;

  @override
  Widget build(context, ref) {
    final router = AutoRouter.of(context);

    final sending = ref.watch(
        editPaymentViewModelProvider(payment).select((value) => value.sending));
    final viewModel = ref.watch(editPaymentViewModelProvider(payment).notifier);

    final formKey = GlobalKey<FormState>();

    final nameController = useTextEditingController(text: payment.name);
    nameController.addListener(() {
      viewModel.setName(nameController.text);
    });
    final priceController =
        useTextEditingController(text: payment.price.toString());
    priceController.addListener(() {
      viewModel.setPrice(priceController.text);
    });

    return sending
        ? const Scaffold(
            body: SafeArea(child: Center(child: CircularProgressIndicator())),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Edit payment'),
            ),
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: '名前'),
                    validator: viewModel.nameValidator,
                  ),
                  TextFormField(
                    controller: priceController,
                    decoration: const InputDecoration(labelText: '金額'),
                    keyboardType: TextInputType.number,
                    validator: viewModel.priceValidator,
                  ),
                  ElevatedButton(
                    onPressed: () => viewModel.onSendPressed(
                      context: context,
                      formKey: formKey,
                      originalPayment: payment,
                    ),
                    child: const Text('送信'),
                  ),
                ],
              ),
            ),
          );
  }
}
