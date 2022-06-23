import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/src/shared/providers/groups.dart';
import 'package:warikan/src/shared/views/drawer.dart';
import 'package:warikan/ui/home/home_view_model.dart';
import 'package:warikan/ui/home/payment_list.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final viewModel = ref.watch(homeViewModelProvider.notifier);

    return state.when(
      data: (data) {
        return DefaultTabController(
          length: _groupsProvider.groups.length + 1,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('HomePage'),
              bottom: TabBar(
                tabs: _groupsProvider.groups
                    .map((group) => Tab(text: group.name))
                    .toList()
                  ..add(const Tab(icon: Icon(Icons.add))),
                isScrollable: true,
              ),
            ),
            body: TabBarView(
              children: _groupsProvider.groups
                  .map<Widget>((group) => PaymentList(group: group))
                  .toList()
                ..add(const Text('')),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () =>
                  {Navigator.of(context).pushNamed('/add_payment')},
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            drawer: const MyDrawer(),
          ),
        );
      },
      error: (e, msg) => Text(e.toString()),
      loading: () {
        return const Scaffold(
          body: SafeArea(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
