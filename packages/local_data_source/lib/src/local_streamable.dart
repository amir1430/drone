// import 'dart:async';
// import 'package:hive/hive.dart';
// import 'package:rxdart/rxdart.dart';

// class HiveStreamable<T extends Object> {
//   HiveStreamable({required Box<T> box}) : _box = box {
//     _valuesController = BehaviorSubject.seeded(_values);
//     _valueController = BehaviorSubject();
//     _deleteController = BehaviorSubject();
//     _subscription = _box.watch().listen((event) {
//       _valuesController.add(_values);
//       if (event.deleted != true) {
//         _valueController.add(event.value as T);
//       } else {
//         _deleteController.add(event.value as T);
//       }
//     });
//   }

//   List<T> get _values => _box.values.toList();

//   late final StreamController<List<T>> _valuesController;
//   late final StreamController<T> _valueController;
//   late final StreamController<T> _deleteController;
//   late final StreamSubscription<BoxEvent> _subscription;

//   final Box<T> _box;

//   // Stream<BoxEvent> get _boxStream => _box.watch();

//   Stream<List<T>> get values => _valuesController.stream;

//   Stream<T> get onAddvalue => _valueController.stream;

//   Stream<T> get onValueDeleted => _deleteController.stream;

//   Future<void> close() async {
//     await _subscription.cancel();
//     await _valueController.close();
//     await _valuesController.close();
//     await _deleteController.close();
//   }
// }
// // import 'dart:async';
// // import 'package:hive/hive.dart';
// // import 'package:rxdart/rxdart.dart';

// // class HiveStreamable<T extends Object> {
// //   const HiveStreamable({required Box<T> box}) : _box = box;

// //   final Box<T> _box;

// //   Stream<BoxEvent> get _boxStream => _box.watch();

// //   Stream<List<T>> get values =>
// //       _boxStream.map((_) => [..._box.values]).startWith(_box.values.toList());

// //   Stream<T> get onAddvalue =>
// //       _boxStream.where((event) => !event.deleted).map((event) => event.value);

// //   Stream<T> get onValueDeleted =>
// //       _boxStream.where((event) => event.deleted).map((event) => event.value);
// // }
