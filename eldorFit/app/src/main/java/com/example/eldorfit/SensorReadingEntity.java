package com.example.eldorfit;

import com.google.firebase.database.IgnoreExtraProperties;
import java.util.ArrayList;
import java.util.List;
import androidx.room.Entity;
import androidx.room.PrimaryKey;
import androidx.room.Database;
import androidx.room.RoomDatabase;
import androidx.room.Dao;
import androidx.room.Insert;
import java.util.List;


@Entity(tableName = "sensor_readings")
public class SensorReadingEntity {
    @PrimaryKey(autoGenerate = true)
    private int id;
    private String sensor;
    private Long timestamp;
    private Double value;

    // Constructor
//    public SensorReading() {
//    }
//
//    // Empty constructor may be needed for Firebase serialization
//    public void addReading(String sensor, Long timestamp, Double value) {
//        this.sensorType.add(sensor);
//        this.timestamp.add(timestamp);
//        this.values.add(value);
//    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setSensor(String sensor) {
        this.sensor = sensor;
    }

    public void setTimestamp(Long timestamp) {
        this.timestamp = timestamp;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    public int getId() {
        return this.id;
    }

    public String getSensor(){
        return this.sensor;
    }

    public Long getTimestamp(){
        return this.timestamp;
    }

    public Double getValue(){
        return this.value;
    }
}
