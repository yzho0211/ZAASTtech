import 'package:floor/floor.dart';
import 'package:flutter_eldorfit/models/sensorReadingEntity.dart';

@dao
abstract class SensorReadingDao {
  @Query('SELECT * FROM Person')
  Future<List<sensor_reading>> findAllReading();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<sensor_reading?> findReadingById(int id);

  @insert
  Future<void> insertPerson(sensor_reading sensor);
}
