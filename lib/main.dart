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
        body: Provider<Dog>(
            create: (context) => Dog(name: "바둑이", age: 5), child: const Home()),
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

class FirstChild extends StatelessWidget {
  const FirstChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("First"),
        Text("dog name : ${Provider.of<Dog>(context).name}"),
        SecondChild(),
      ],
    );
  }
}

class SecondChild extends StatelessWidget {
  const SecondChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Second"),
        Text("dog age : ${Provider.of<Dog>(context).age}"),
      ],
    );
  }
}
