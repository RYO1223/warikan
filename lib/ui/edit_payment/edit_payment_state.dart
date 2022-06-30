import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_payment_state.freezed.dart';

@freezed
class EditPaymentState with _$EditPaymentState {
  const factory EditPaymentState({
    @Default('') String name,
    @Default('') String price,
    @Default(false) bool sending,
  }) = _EditPaymentState;
}
