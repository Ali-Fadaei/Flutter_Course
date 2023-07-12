import 'package:flutter/material.dart';

// -Google Material: https://m3.material.io/

class GoogleMaterial extends StatelessWidget {
//
  const GoogleMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'material',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreenAccent,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('material'),
          centerTitle: true,
          // leading: IconButton(
          //   icon: const Icon(Icons.notifications),
          //   onPressed: () {},
          // ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.grey,
            child: Column(),
          ),
        ),
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
