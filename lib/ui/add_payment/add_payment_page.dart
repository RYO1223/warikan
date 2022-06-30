import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/data/model/group/group.dart';
import 'package:warikan/ui/add_payment/add_payment_view_model.dart';

class AddPaymentPage extends HookConsumerWidget {
  const AddPaymentPage({
    Key? key,
    required this.group,
  }) : super(key: key);

  final Group group;

  @override
  Widget build(context, ref) {
    final router = AutoRouter.of(context);

    final sending =
        ref.watch(addPaymentViewModelProvider.select((value) => value.sending));
    final viewModel = ref.watch(addPaymentViewModelProvider.notifier);

    final formKey = GlobalKey<FormState>();

    final nameController = useTextEditingController();
    nameController.addListener(() {
      viewModel.setName(nameController.text);
    });
    final priceController = useTextEditingController();
    priceController.addListener(() {
      viewModel.setPrice(priceController.text);
    });

    return sending
        ? const Scaffold(
            body: SafeArea(child: Center(child: CircularProgressIndicator())),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Add payment'),
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
                      formKey: formKey,
                      router: router,
                      group: group,
                    ),
                    child: const Text('送信'),
                  ),
                ],
              ),
            ),
          );
  }
}
