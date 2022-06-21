import 'package:flutter/material.dart';
import 'package:warikan/src/features/home/payment_list.dart';
import 'package:warikan/src/shared/providers/groups.dart';
import 'package:warikan/src/shared/views/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GroupsProvider _groupsProvider = GroupsProvider();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _groupsProvider.groups.length + 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
          onPressed: () => {},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
