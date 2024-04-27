package com.example.eldorfit;

import com.google.firebase.database.IgnoreExtraProperties;
import java.util.ArrayList;
import java.util.List;

@IgnoreExtraProperties
public class SensorReading {

    private List<String> sensorType = new ArrayList<>();
    private List<Long> timestamp = new ArrayList<>();
    private List<Double> values = new ArrayList<>();

    // Constructor
    public SensorReading() {
    }

    // Empty constructor may be needed for Firebase serialization
    public void addReading(String sensor, Long timestamp, Double value) {
        this.sensorType.add(sensor);
        this.timestamp.add(timestamp);
        this.values.add(value);
    }

    public List<String> getSensorType(){
        return this.sensorType;
    }

    public List<Long> getTimestamp(){
        return this.timestamp;
    }

    public List<Double> getValues(){
        return this.values;
    }
}
