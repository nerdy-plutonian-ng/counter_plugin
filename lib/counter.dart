import 'package:flutter/services.dart';

class Counter {
  final _methodChannel = const MethodChannel('counterChannel');
  final _eventChannel = const EventChannel('counterEvents');

  Counter._();

  static final _instance = Counter._();

  factory Counter() => _instance;

  Future<int?> increaseCounter() {
    return _methodChannel.invokeMethod<int?>('increase');
  }

  Stream<Object?> listenToCount() {
    return _eventChannel.receiveBroadcastStream();
  }

  Future<bool?> stopListening() async {
    return _methodChannel.invokeMethod<bool?>('stopListening');
  }
}
