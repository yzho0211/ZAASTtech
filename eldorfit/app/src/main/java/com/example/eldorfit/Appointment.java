package com.example.eldorfit;
import com.google.gson.annotations.SerializedName;

public class Appointment {
    @SerializedName("name")
    private String name;

    @SerializedName("doctor")
    private String doctor;

    @SerializedName("time")
    private String time;

    @SerializedName("date")
    private String date;

    // Constructors, getters, and setters
    public Appointment() {
    }

    public Appointment(String name, String doctor, String time, String date) {
        this.name = name;
        this.doctor = doctor;
        this.time = time;
        this.date = date;
    }

    // Getters and setters

    public String getName() {
        return this.name;
    }

    public String getDoctor() {
        return this.doctor;
    }

    public String getTime() {
        return this.time;
    }

    public String getDate() {
        return this.date;
    }

}

