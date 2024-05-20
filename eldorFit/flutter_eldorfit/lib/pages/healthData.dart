import '../models/healthDataReceiver.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/services.dart';
// ignore: unused_import
import 'package:sqflite/sqflite.dart';

// ignore: unused_import
import '../models/appDataBase.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';

class DataVisualizer extends StatefulWidget {
  @override
  _DataVisualizerState createState() => _DataVisualizerState();
}

class _DataVisualizerState extends State<DataVisualizer> {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<charts.Series<DataPoint, DateTime>> _seriesList = [];
  static const platform = MethodChannel('flutter.java.channel');

  void sendDataToJava(String data) async {
    try {
      await platform.invokeMethod('sendHealthDataToJava', data);
    } on PlatformException catch (e) {
      print("Failed to send data to Java: '${e.message}'.");
    }
  }

  // Future<List<charts.Series<DataPoint, DateTime>>> getSensorReadings() async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   List<DataPoint> sensorReadings = [];

  //   try {
  //     QuerySnapshot querySnapshot =
  //         await firestore.collection('sensorReadings').get();

  //     querySnapshot.docs.forEach((DocumentSnapshot document) {
  //       Map<String, dynamic> data = document.data() as Map<String, dynamic>;
  //       String sensor = data['sensorType'];
  //       int timestamp = data['timestamp'];
  //       double value = data['values'];

  //       DataPoint reading = DataPoint(sensor, timestamp, value);
  //       sensorReadings.add(reading);
  //     });
  //   } catch (e) {
  //     print('Error fetching sensor readings: $e');
  //     return []; // Return an empty list in case of an error
  //   }

  // Convert sensorReadings to a list of charts.Series<DataPoint, DateTime>
  //   List<charts.Series<DataPoint, DateTime>> seriesList = [
  //     charts.Series<DataPoint, DateTime>(
  //       id: 'Sensor Readings',
  //       data: sensorReadings,
  //       domainFn: (DataPoint reading, _) =>
  //           DateTime.fromMillisecondsSinceEpoch(reading.timestamp),
  //       measureFn: (DataPoint reading, _) => reading.value,
  //       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
  //     ),
  //   ];

  //   return seriesList;
  // }

  // Future<Map<DataPoint, DateTime>> getSensorReadings() async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   // List<DataPoint> sensorReadings = [];
  //   Map<DataPoint, DateTime> sensorReadings = {};
  //   try {
  //     QuerySnapshot querySnapshot =
  //         await firestore.collection('sensorReadings').get();

  //     querySnapshot.docs.forEach((DocumentSnapshot document) {
  //       Map<String, dynamic> data = document.data() as Map<String, dynamic>;
  //       String sensor = data['sensorType'];
  //       int timestamp = data['timestamp'];
  //       double value = data['values'];

  //       DataPoint reading = DataPoint(sensor, timestamp, value);
  //       // DataPoint reading = SensorReading(sensor, value);
  //       sensorReadings[reading] = DateTime.fromMillisecondsSinceEpoch(timestamp);
  //     });
  //   } catch (e) {
  //     print('Error fetching sensor readings: $e');
  //   }

  //   return sensorReadings;
  // }

  void fetchData() async {
    // final Database db =
    //     await AppDatabase.databaseBuilder('app_database.db').build();
    // List<Map<String, dynamic>> tempList = await db.query('sensor_readings');
    // setState(() {
    //   itemList = tempList;
    // });
  }

  @override
  void initState() {
    super.initState();
    healthDataReceiver().initializeCommunication().then((_) {
      // Update _seriesList based on received data
    });
    // _fetchSensorReadings();
    // _seriesList = getSensorReadings();
    fetchData();
    // final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    sendDataToJava("");
    print("Initialising data receiver");
  }

  // Future<void> _fetchSensorReadings() async {
  //   List<charts.Series<DataPoint, DateTime>> seriesList =
  //       await getSensorReadings();
  //   setState(() {
  //     _seriesList = seriesList;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      _seriesList,
      animate: true,
    );
  }
}

class DataPoint {
  final String sensor;
  final int timestamp;
  final num value;

  DataPoint(this.sensor, this.timestamp, this.value);
}
