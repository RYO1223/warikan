import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warikan/ui/home/home_view_model.dart';
import 'package:warikan/ui/home/payment_list.dart';
import 'package:warikan/ui/shared/drawer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);

    return state.when(
      error: (e, msg) => Text(e.toString()),
      loading: () {
        return const Scaffold(
            body: SafeArea(child: Center(child: CircularProgressIndicator())));
      },
      data: (data) {
        return DefaultTabController(
          length: data.groups.length + 1,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('HomePage'),
              bottom: TabBar(
                tabs: data.groups.map((group) => Tab(text: group.name)).toList()
                  ..add(const Tab(icon: Icon(Icons.add))),
                isScrollable: true,
              ),
            ),
            body: TabBarView(
              children: data.groups
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
    );
  }
}
