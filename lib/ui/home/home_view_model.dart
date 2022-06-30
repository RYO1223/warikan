import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/data/model/group/group.dart';
import 'package:warikan/data/model/payment/payment.dart';
import 'package:warikan/data/repository/groups/groups_repository.dart';
import 'package:warikan/data/repository/groups/groups_repository_impl.dart';
import 'package:warikan/ui/home/home_state.dart';
import 'package:warikan/ui/routes/app_route.gr.dart';

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, AsyncValue<HomeState>>(
  (ref) => HomeViewModel(ref: ref),
);

class HomeViewModel extends StateNotifier<AsyncValue<HomeState>> {
  HomeViewModel({required this.ref}) : super(const AsyncLoading()) {
    load();
  }

  final StateNotifierProviderRef<HomeViewModel, AsyncValue<HomeState>> ref;

  late final GroupsRepository groupsRepository =
      ref.watch(groupsRepositoryProvider);

  Future<void> load() async {
    final groups = await groupsRepository.fetchWithPayments();
    state = AsyncValue.data(HomeState(groups: groups));
  }

  void onFloatingActionButtonPressed(
      {required StackRouter router, required Group group}) async {
    final payment = await router.push<Payment>(AddPaymentRoute(group: group));
    if (payment == null) return;

    final groups = state.value!.groups.map((group) {
      if (group.id != payment.group.id) return group;
      return group.copyWith(payments: group.payments.toList()..add(payment));
    }).toList();

    state = AsyncValue.data(HomeState(groups: groups));
  }

  void onPaymentTap({
    required BuildContext context,
    required Payment originalPayment,
  }) async {
    final router = AutoRouter.of(context);
    final newPayment =
        await router.push<Payment>(EditPaymentRoute(payment: originalPayment));
    if (newPayment == null) return;

    if (newPayment.deleted) {
      final newGroups = state.value!.groups.map((group) {
        return group.copyWith(
          payments: () {
            final tmpPayments = group.payments.toList();
            tmpPayments.removeWhere((payment) {
              return payment.id == originalPayment.id;
            });
            return tmpPayments;
          }(),
        );
      }).toList();
      state = AsyncValue.data(HomeState(groups: newGroups));
      return;
    }

    final newGroups = state.value!.groups.map((group) {
      return group.copyWith(
        payments: group.payments.map((payment) {
          if (payment.id != originalPayment.id) return payment;
          return newPayment;
        }).toList(),
      );
    }).toList();
    state = AsyncValue.data(HomeState(groups: newGroups));
  }
}
