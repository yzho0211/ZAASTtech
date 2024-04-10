package com.example.eldorfit;
import com.google.gson.annotations.SerializedName;

public class Medicine {
    @SerializedName("name")
    private String name;

    @SerializedName("amount")
    private String amount;

    @SerializedName("time")
    private String time;

    @SerializedName("days")
    private String days;

    @SerializedName("instructions")
    private String instructions;

    // Constructors, getters, and setters
    public Medicine() {
    }

    public Medicine(String name, String amount, String time, String days, String instructions) {
        this.name = name;
        this.amount = amount;
        this.time = time;
        this.days = days;
        this.instructions = instructions;
    }

    // Getters and setters

    public String getName() {
        return name;
    }

    public String getAmount() {
        return amount;
    }

    public String getTime() {
        return time;
    }

    public String getDay() {
        return days;
    }

    public String getInstructions(){
        return instructions;
    }

}
