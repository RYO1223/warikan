import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/data/model/group/group.dart';
import 'package:warikan/data/model/payment/payment.dart';
import 'package:warikan/data/repository/payments/payments_repository_impl.dart';
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

  void onNameChanged(String name) {
    state = AsyncValue.data(state.value!.copyWith(name: name));
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

  void onPriceChanged(String price) {
    state = AsyncValue.data(state.value!.copyWith(price: price));
  }

  void onSendPressed({
    required GlobalKey<FormState> formKey,
    required StackRouter router,
    required Group group,
    required String name,
    required String price,
  }) async {
    if (formKey.currentState!.validate()) {
      print("$name $price");
      state.when(
        loading: () {},
        error: (_, __) {},
        data: (data) {
          final payment = Payment(
            id: '',
            group: group,
            name: name,
            price: int.parse(price),
          );
          final paymentsRepository = ref.watch(paymentsRepositoryProvider);
          paymentsRepository
              .addPayment(payment)
              .whenComplete(() => router.pop());
        },
      );
    }
  }
}
