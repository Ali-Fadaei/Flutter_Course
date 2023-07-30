import 'package:flutter/material.dart';
import 'package:widget_types/counter_text.dart';

class CounterPage extends StatefulWidget {
//
  final int initCount;

  final int step;

  const CounterPage({
    super.key,
    this.initCount = 0,
    this.step = 1,
  });

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
//
  int counter = 0;

  @override
  void initState() {
    //print('init state fired!');
    counter = widget.initCount;
    super.initState();
  }

  void onCounterButtonPressed() {
    setState(() {
      counter = counter + widget.step;
    });
  }

  @override
  Widget build(BuildContext context) {
    //print('build fired!');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: onCounterButtonPressed,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 600,
          color: Colors.cyan.shade100,
          alignment: Alignment.center,
          child: CounterText(count: counter),
        ),
      ),
    );
  }
}
