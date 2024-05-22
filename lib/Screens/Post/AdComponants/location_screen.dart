
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:classic_ads/Screens/Components/custom_dialog.dart';
import 'package:classic_ads/Screens/Home/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Location',
          style: TextStyle(fontSize: 14),
        ),
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_left),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
        actions: [ 
          IconButton(
            onPressed: () {
              DialogBox().dialogBox(context, DialogType.noHeader, 'Exit form?',
                  'Are you sure want to exit from this form?\n if you do, all you entered data will be lost.',
                  () {
                Get.to(
                  () => const HomeScreen(),
                  transition: Transition.cupertino,
                  fullscreenDialog: true,
                );
              }, () {});
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: ExpandableList(items: _items),
    );
  }
}

class ExpandableList extends StatelessWidget {
  final List<String> items;

  ExpandableList({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(
            items[index],
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            Icons.arrow_drop_down,
            color: Colors.blue,
          ),
          initiallyExpanded: index == 0, // Expand the first item by default
          children: [
            ListTile(
              title: Text('Subitem 1'),
            ),
            ListTile(
              title: Text('Subitem 2'),
            ),
            ListTile(
              title: Text('Subitem 3'),
            ),
          ],
        );
      },
    );
  }
}