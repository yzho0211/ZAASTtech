package com.example.eldorfit;

import androidx.room.Database;
import androidx.room.RoomDatabase;

@Database(entities = {SensorReadingEntity.class}, version = 2)
public abstract class AppDatabase extends RoomDatabase {
    public abstract SensorReadingDao sensorReadingDao();
}
