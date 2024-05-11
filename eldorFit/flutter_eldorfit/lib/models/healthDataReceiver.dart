import 'package:flutter/services.dart';
import 'dart:convert';

class healthDataReceiver {
  static const platformChannel = MethodChannel('flutter.java.channel');

  Future<void> initializeCommunication() async {
    // await Future.delayed(Duration(milliseconds: 500));
    print("intialized  communication");
    platformChannel.setMethodCallHandler(_handleDataFromJava);
  }

  Future<dynamic> _handleDataFromJava(MethodCall call) async {
    // Process the data received from Java here
    print("Waiting for Data from Java");
    if (call.method == "receiveHealthDataFromJava") {
      print("received Data from java");
      return processData(call.arguments.toString());
    }
  }

  // Example processing (modify based on your expected data)
  processData(data) {
    // Assuming data is a Map

    Map<String, dynamic> parsedData = jsonDecode(data);
    print('Sensor: ${parsedData['sensor']}');
    print('Timestamp: ${parsedData['timestamp']}');
    print('Value: ${parsedData['value']}');

    // print('Received Data: $data');
    return data;
  }
}
