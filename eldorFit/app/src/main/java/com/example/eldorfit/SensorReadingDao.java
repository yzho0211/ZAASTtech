package com.example.eldorfit;

import androidx.room.Dao;
import androidx.room.Insert;

@Dao
public interface SensorReadingDao {
    @Insert
    void insert(SensorReadingEntity sensorReading);
}
