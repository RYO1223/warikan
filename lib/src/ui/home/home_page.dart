import 'package:flutter/material.dart';
import 'package:warikan/src/shared/providers/groups.dart';
import 'package:warikan/src/shared/views/drawer.dart';
import 'package:warikan/src/ui/home/payment_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GroupsProvider _groupsProvider = GroupsProvider();
  @override
  Widget build(BuildContext context) {
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
          onPressed: () => {Navigator.of(context).pushNamed('/add_payment')},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
