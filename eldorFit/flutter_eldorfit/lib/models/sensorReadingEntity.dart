import 'package:floor/floor.dart';

@entity
class sensor_reading {
  @primaryKey
  int id;
  String sensor;
  int timestamp;
  double value;

  sensor_reading(this.id, this.sensor, this.timestamp, this.value);
}
