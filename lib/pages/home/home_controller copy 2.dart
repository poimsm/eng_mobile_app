import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class City {
  City({required this.name, required this.population});
  String name;
  int population;

  City copyWith({name, population}) {
    return City(name:name ?? this.name, population: population ?? this.population);
  }
}

class Profile {
  final String name;
  final int age;

  const Profile(this.name, this.age);

  Profile copyWith({name, age}) {
    return Profile(name ?? this.name, age ?? this.age);
  }
}


class CityNotifier extends StateNotifier<City> {
  CityNotifier() : super(City(name: 'Londer', population: 100));

  void changeName(String name) {
    state.name = name;
    // state =  state.name = name
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }
}

// final counterModelProvider = ChangeNotifierProvider((ref) => CityNotifier());

final counterProvider = StateNotifierProvider.autoDispose<CityNotifier, City>((ref) {
  return CityNotifier();
});

// final profileProvider = 
//      StateNotifierProvider<ProfileStateNotifier, Profile>(
//          (_) => ProfileStateNotifier(const Profile("", -1))
//     );



// class HomeController with StateNotifier<CounterState> {
//   HomeController()
//   int counter = 0;

//   void increase() {
//     counter++;
//     notifyListeners();
//   }
  
// }

// final counterProvider = StateNotifierProvider<Counter, int>((ref) {
//   return Counter();
// });

// final homeController = ChangeNotifierProvider()

// final counterModelProvider = ChangeNotifierProvider((ref) => CounterModel());