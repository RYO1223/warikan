import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/ui/home/home_state.dart';
import 'package:warikan/ui/home/home_view_model.dart';
import 'package:warikan/ui/home/payment_list.dart';
import 'package:warikan/ui/shared/drawer.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);

    return state.when(
        error: (e, msg) => Text(e.toString()),
        loading: () {
          return const Scaffold(
              body:
                  SafeArea(child: Center(child: CircularProgressIndicator())));
        },
        data: (data) => HomeTab(state: data));
  }
}

class HomeTab extends HookConsumerWidget {
  const HomeTab({Key? key, required this.state}) : super(key: key);

  final HomeState state;

  @override
  Widget build(context, ref) {
    final router = AutoRouter.of(context);
    final viewModel = ref.watch(homeViewModelProvider.notifier);

    final tabController =
        useTabController(initialLength: state.groups.length + 1);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        bottom: TabBar(
          controller: tabController,
          tabs: state.groups.map((group) => Tab(text: group.name)).toList()
            ..add(const Tab(icon: Icon(Icons.add))),
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: state.groups
            .map<Widget>((group) => PaymentList(group: group))
            .toList()
          ..add(const Text('')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.onFloatingActionButtonPressed(
          router: router,
          group: state.groups[tabController.index],
        ),
        child: const Icon(Icons.add),
      ),
      drawer: const MyDrawer(),
    );
  }
}
