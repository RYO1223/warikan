import 'package:flutter/material.dart';
import 'package:warikan/src/features/home/payment_list.dart';
import 'package:warikan/src/shared/views/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Page1'),
              Tab(text: 'Page2'),
              Tab(text: 'Page3'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PaymentList(),
            Text('Page2'),
            Text('Page3'),
          ],
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
