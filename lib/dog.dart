import 'package:flutter/widgets.dart';
import 'package:flutter_provider/big_dog.dart';

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

  Future<BigDog> getBigDog() async {
    await Future.delayed(const Duration(seconds: 3));
    return BigDog(name: "SuperBigDog");
  }
}
