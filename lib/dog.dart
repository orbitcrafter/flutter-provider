import 'package:flutter/widgets.dart';

class Dog with ChangeNotifier {
  String name;
  int age;

  Dog({
    required this.name,
    required this.age,
  });

  void grow() {
    print('current age : $age');
    age++;
    notifyListeners();
  }
}
