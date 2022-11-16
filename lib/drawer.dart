import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/data.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Drawer(
            child: Column(
                children: [
                    // Menambahkan clickable menu
                    ListTile(
                        title: const Text('counter_7'),
                        onTap: () {
                        // Route menu ke halaman utama
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const MyHomePage()),
                        );
                        },
                    ),
                    ListTile(
                        title: const Text('Add Budget Info'),
                        onTap: () {
                        // Route menu ke halaman form
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const MyFormPage()),
                        );
                        },
                    ),
                    ListTile(
                        title: const Text('Budget Info'),
                        onTap: () {
                        // Route menu ke halaman form
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const MyDataPage()),
                        );
                        },
                    ),
                ],
            ),
        );
    }
}