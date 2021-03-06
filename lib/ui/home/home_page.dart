import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:warikan/data/model/group/group.dart';
import 'package:warikan/ui/home/home_view_model.dart';
import 'package:warikan/ui/shared/drawer.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = AutoRouter.of(context);
    final state = ref.watch(homeViewModelProvider);
    final viewModel = ref.watch(homeViewModelProvider.notifier);

    return state.when(
      error: (e, msg) => Text(e.toString()),
      loading: () {
        return const Scaffold(
            body: SafeArea(child: Center(child: CircularProgressIndicator())));
      },
      data: (data) {
        final tabController =
            useTabController(initialLength: data.groups.length + 1);

        return Scaffold(
          appBar: AppBar(
            title: const Text('HomePage'),
            bottom: TabBar(
              controller: tabController,
              tabs: data.groups.map((group) => Tab(text: group.name)).toList()
                ..add(const Tab(icon: Icon(Icons.add))),
              isScrollable: true,
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: data.groups
                .map<Widget>((group) => HomePageBody(group: group))
                .toList()
              ..add(const Text('')),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => viewModel.onFloatingActionButtonPressed(
              router: router,
              group: data.groups[tabController.index],
            ),
            child: const Icon(Icons.add),
          ),
          drawer: const MyDrawer(),
        );
      },
    );
  }
}

class HomePageBody extends ConsumerWidget {
  const HomePageBody({Key? key, required this.group}) : super(key: key);

  final Group group;

  @override
  Widget build(context, ref) {
    final viewModel = ref.watch(homeViewModelProvider.notifier);

    final totalPrice = group.payments
        .map((e) => e.price)
        .reduce((value, element) => value + element);
    final dateFormatter = DateFormat('yyyy/MM/dd');

    return ListView(
      children: [
        ListTile(title: Text('????????????: $totalPrice???')),
        const Divider(color: Colors.grey),
        ...() {
          return group.payments
              .map<List<Widget>>((payment) {
                return [
                  ListTile(
                    title: Text(payment.name),
                    subtitle: Text(
                        '${payment.price.toString()}???\n${dateFormatter.format(payment.createdAt)}'),
                    isThreeLine: true,
                    onTap: () => viewModel.onPaymentTap(
                      context: context,
                      originalPayment: payment,
                    ),
                  ),
                  const Divider(color: Colors.grey),
                ];
              })
              .expand((e) => e)
              .toList();
        }(),
      ],
    );
  }
}
