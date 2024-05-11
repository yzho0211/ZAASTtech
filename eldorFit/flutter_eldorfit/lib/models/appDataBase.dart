import 'package:floor/floor.dart';
import 'package:flutter_eldorfit/models/sensorReadingEntity.dart';
import 'package:flutter_eldorfit/models/sensorReadingDao.dart';

@Database(version: 1, entities: [sensor_reading])
abstract class AppDatabase extends FloorDatabase {
  SensorReadingDao get sensorReadingDao;
}
