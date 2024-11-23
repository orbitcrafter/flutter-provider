import 'package:flutter/material.dart';
import 'package:flutter_provider/dog.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("title"),
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider<Dog>(
              create: (context) => Dog(name: "바둑이", age: 5),
            ),
          ],
          child: Home(),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FirstChild();
  }
}

class FirstChild extends StatefulWidget {
  const FirstChild({super.key});

  @override
  State<FirstChild> createState() => _FirstChildState();
}

class _FirstChildState extends State<FirstChild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("First"),
        Text("name : ${context.read<Dog>().name}"),
        SecondChild(),
      ],
    );
  }
}

class SecondChild extends StatefulWidget {
  const SecondChild({super.key});

  @override
  State<SecondChild> createState() => _SecondChildState();
}

class _SecondChildState extends State<SecondChild> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Second"),
        Text("age : ${context.watch<Dog>().age}"),
        ThirdChild(),
      ],
    );
  }
}

class ThirdChild extends StatefulWidget {
  const ThirdChild({super.key});

  @override
  State<ThirdChild> createState() => _ThirdChildState();
}

class _ThirdChildState extends State<ThirdChild> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<Dog>().grow(),
      child: const Icon(Icons.add),
    );
  }
}
