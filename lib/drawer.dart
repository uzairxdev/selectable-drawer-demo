import 'package:flutter/material.dart';

class SelectableDrawer extends StatefulWidget {
  const SelectableDrawer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectableDrawerState createState() => _SelectableDrawerState();
}

class _SelectableDrawerState extends State<SelectableDrawer> {
  int _selectedIndex = 0;

  final List<String> _drawerItems = [
    'Home',
    'Profile',
    'Settings',
    'Logout',
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context); // Close the drawer
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selectable Drawer Demo'),
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: _drawerItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_drawerItems[index]),
              selected: index == _selectedIndex,
              onTap: () => _onItemSelected(index),
            );
          },
        ),
      ),
      body: Center(
        child: Text('Selected Item: ${_drawerItems[_selectedIndex]}'),
      ),
    );
  }
}
