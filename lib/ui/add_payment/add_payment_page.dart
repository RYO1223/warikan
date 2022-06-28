import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/ui/add_payment/add_payment_view_model.dart';

class AddPaymentPage extends HookConsumerWidget {
  const AddPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final router = AutoRouter.of(context);

    final state = ref.watch(addPaymentViewModelProvider);
    final viewModel = ref.watch(addPaymentViewModelProvider.notifier);

    final formKey = GlobalKey<FormState>();

    return state.when(
      error: (e, msg) => Text(e.toString()),
      loading: () {
        return const Scaffold(
            body: SafeArea(child: Center(child: CircularProgressIndicator())));
      },
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add payment'),
          ),
          body: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: TextEditingController(text: data.name),
                  decoration: const InputDecoration(labelText: '名前'),
                  validator: viewModel.nameValidator,
                ),
                TextFormField(
                  controller: TextEditingController(text: data.price),
                  decoration: const InputDecoration(labelText: '金額'),
                  keyboardType: TextInputType.number,
                  validator: viewModel.priceValidator,
                ),
                ElevatedButton(
                  onPressed: () => viewModel.onSendPressed(formKey, router),
                  child: const Text('送信'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
