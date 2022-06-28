import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/ui/add_payment/add_payment_state.dart';

final addPaymentViewModelProvider =
    StateNotifierProvider<AddPaymentViewModel, AsyncValue<AddPaymentState>>(
  (ref) => AddPaymentViewModel(ref: ref),
);

class AddPaymentViewModel extends StateNotifier<AsyncValue<AddPaymentState>> {
  AddPaymentViewModel({required this.ref})
      : super(const AsyncValue.data(AddPaymentState()));

  final StateNotifierProviderRef<AddPaymentViewModel,
      AsyncValue<AddPaymentState>> ref;

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '名前をつけてください';
    }
    return null;
  }

  String? priceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '金額を入力してください';
    }
    if (int.tryParse(value) == null) {
      return '数字のみで入力してください';
    }
    return null;
  }

  void onSendPressed(GlobalKey<FormState> formKey, StackRouter router) {
    if (formKey.currentState!.validate()) {
      router.pop();
    }
  }
}
