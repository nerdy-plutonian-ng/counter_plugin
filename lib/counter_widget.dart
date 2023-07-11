import 'package:flutter/material.dart';

import 'counter.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  final counter = Counter();

  var isListening = false;

  var count = 0;

  increase() {
    counter.increaseCounter().then((value) {
      setState(() {
        count = value ?? count;
      });
    });
  }

  startListening() {
    isListening = true;
    counter.listenToCount().listen((event) {
      final number = event as int?;
      if (number != null) {
        setState(() {
          count = number;
        });
      }
    }).onError((_) {
      setState(() {
        isListening = false;
      });
    });
  }

  stopListening() {
    counter.stopListening().then((value) {
      setState(() {
        isListening = !value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(count.toString()),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed: increase,
              ),
              IconButton(
                icon: Icon(
                  isListening ? Icons.stop : Icons.play_arrow,
                  color: isListening ? Colors.red : Colors.green,
                ),
                onPressed: isListening ? stopListening : startListening,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
