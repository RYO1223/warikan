import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/data/model/group/group.dart';
import 'package:warikan/data/model/payment/payment.dart';
import 'package:warikan/data/repository/payments/payments_repository_impl.dart';
import 'package:warikan/ui/add_payment/add_payment_state.dart';

final addPaymentViewModelProvider =
    StateNotifierProvider<AddPaymentViewModel, AddPaymentState>(
  (ref) => AddPaymentViewModel(ref: ref),
);

class AddPaymentViewModel extends StateNotifier<AddPaymentState> {
  AddPaymentViewModel({required this.ref}) : super(const AddPaymentState());

  final StateNotifierProviderRef<AddPaymentViewModel, AddPaymentState> ref;

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setPrice(String price) {
    state = state.copyWith(price: price);
  }

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

  void onSendPressed({
    required GlobalKey<FormState> formKey,
    required StackRouter router,
    required Group group,
  }) async {
    if (formKey.currentState!.validate()) {
      state = state.copyWith(sending: true);
      final payment = Payment(
        id: '',
        group: group,
        name: state.name,
        price: int.parse(state.price),
      );
      final paymentsRepository = ref.watch(paymentsRepositoryProvider);
      paymentsRepository.addPayment(payment).then((data) {
        router.pop<Payment>(data);
      }).whenComplete(() {
        state = state.copyWith(sending: false);
      });
    }
  }
}
