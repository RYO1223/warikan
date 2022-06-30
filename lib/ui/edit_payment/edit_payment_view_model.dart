import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/data/model/payment/payment.dart';
import 'package:warikan/data/repository/payments/payments_repository_impl.dart';
import 'package:warikan/ui/edit_payment/edit_payment_state.dart';
import 'package:warikan/ui/shared/error_dialog.dart';

final editPaymentViewModelProvider = StateNotifierProvider.family<
    editPaymentViewModel, EditPaymentState, Payment>(
  (ref, payment) => editPaymentViewModel(ref: ref, payment: payment),
);

class editPaymentViewModel extends StateNotifier<EditPaymentState> {
  editPaymentViewModel({
    required this.ref,
    required Payment payment,
  }) : super(
          EditPaymentState(
            name: payment.name,
            price: payment.price.toString(),
          ),
        );

  final StateNotifierProviderRef<editPaymentViewModel, EditPaymentState> ref;

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
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required Payment originalPayment,
  }) async {
    if (formKey.currentState!.validate()) {
      final router = AutoRouter.of(context);

      state = state.copyWith(sending: true);
      final payment = originalPayment.copyWith(
        name: state.name,
        price: int.parse(state.price),
      );
      final paymentsRepository = ref.watch(paymentsRepositoryProvider);

      paymentsRepository.editPayment(payment).then((data) {
        router.pop<Payment>(payment);
      }).catchError((error) {
        showDialog(
          context: context,
          builder: (context) => ErrorDialog(error: error),
        );
      }).whenComplete(() {
        state = state.copyWith(sending: false);
      });
    }
  }
}
