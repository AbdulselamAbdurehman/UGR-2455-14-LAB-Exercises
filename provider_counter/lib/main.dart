import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Counter App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Provider Counter App'),
        ),
        body: Center(
          child: ChangeNotifierProvider(
            create: (context) => Counter(),
            child: const CounterApp(),
          ),
        ),
      ),
    );
  }
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Counter Value:',
        ),
        Text(
          '${counter.count}',
          style: const TextStyle(fontSize: 48),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                counter.increment();
              },
              child: const Text('+'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                counter.decrement();
              },
              child: const Text('-'),
            ),
          ],
        ),
      ],
    );
  }
}

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // Notify listeners about the change
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
