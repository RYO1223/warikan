import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          UserAccountsDrawerHeader(
            accountName: Text('UserName'),
            accountEmail: Text('test.example.com'),
          ),
          ListTile(
            title: Text('Home'),
          ),
          ListTile(
            title: Text('Pro'),
          ),
          ListTile(
            title: Text('Help'),
          ),
        ],
      ),
    );
  }
}
