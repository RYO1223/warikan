import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_payment_state.freezed.dart';

@freezed
class AddPaymentState with _$AddPaymentState {
  const factory AddPaymentState({
    @Default('') String name,
    @Default('') String price,
  }) = _AddPaymentState;
}
