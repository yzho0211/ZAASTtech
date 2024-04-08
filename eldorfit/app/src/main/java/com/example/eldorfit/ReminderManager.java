package com.example.eldorfit;


import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.os.Build;
import java.util.Calendar;
import java.util.List;


public class ReminderManager {
    private static final String NOTIFICATION_CHANNEL_ID = "notification.id";
    private static final int NOTIFICATION_ID = 1;

    public static void setReminders(Context context, List<Reminder> medicines) {
        System.out.println("set reminders");
        for (Reminder medicine : medicines) {
//            setReminderForMedicine(context, medicine);
        }
    }

    private static void setReminderForMedicine(Context context, Reminder medicine) {
        // Set reminder time (you may adjust this as needed)
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        calendar.add(Calendar.MINUTE, 1); // Example: Set reminder 1 minutes from now
        System.out.println("Setting alarm");
        // Set the alarm to trigger at the specified time
//        alarmManager.setExact(AlarmManager.RTC_WAKEUP, calendar.getTimeInMillis(), pendingIntent);
    }
}

