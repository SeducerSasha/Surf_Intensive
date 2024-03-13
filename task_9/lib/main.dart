import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttons Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Кнопки заполонили планету!'),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => print('pressed TextButton'),
              child: const Text('I am TextButton'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => print('pressed ElevatedButton'),
              child: const Text('I am ElevatedButton'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => print('pressed OutlinedButton'),
              child: const Text('I am OutlinedButton'),
            ),
            const SizedBox(height: 8),
            CupertinoButton(
              onPressed: () => print('pressed CupertinoButton'),
              child: const Text('I am CupertinoButton'),
            ),
            const SizedBox(height: 8),
            CupertinoButton.filled(
              onPressed: () => print('pressed CupertinoButton.filled'),
              child: const Text('I am CupertinoButton with background'),
            ),
            const SizedBox(height: 8),
            IconButton(
              onPressed: () => print('pressed IconButton'),
              icon: const Icon(Icons.access_alarm),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => print('pressed ElevatedButton with Icons'),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.call),
                  SizedBox(width: 8),
                  Text('I am ElevatedButton with Icons'),
                ],
              ),
            ),
            const SizedBox(height: 8),
            FloatingActionButton(
              onPressed: () => print('pressed FloatingActionButton'),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 8),
            FloatingActionButton.small(
              onPressed: () => print('pressed FloatingActionButton.small'),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 8),
            FloatingActionButton.extended(
              onPressed: () => print('pressed FloatingActionButton.extended'),
              tooltip: 'Increment',
              label: const Text('Я широкая кнопка'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('pressed FloatingActionButton'),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
