package com.example.eldorfit;
import com.google.gson.annotations.SerializedName;

public class Reminder {
    @SerializedName("name")
    private String name;

    @SerializedName("amount")
    private String amount;

    @SerializedName("timesPerDay")
    private String timesPerDay;

    @SerializedName("quantity")
    private String quantity;

    // Constructors, getters, and setters
    public Reminder() {
    }

    public Reminder(String name, String amount, String timesPerDay, String quantity) {
        this.name = name;
        this.amount = amount;
        this.timesPerDay = timesPerDay;
        this.quantity = quantity;
    }

    // Getters and setters

    public String getName() {
        return name;
    }

    public String getAmount() {
        return amount;
    }

    public String getQuantity() {
        return quantity;
    }

    public String getTimesPerDay() {
        return timesPerDay;
    }

}
