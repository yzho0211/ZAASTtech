package com.example.eldorfit;

import android.content.DialogInterface;
import android.app.AlertDialog;
import android.os.Bundle;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodChannel;
import com.google.gson.Gson;
import android.Manifest;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.pm.PackageManager;
import android.os.Build;
import androidx.core.content.ContextCompat;
import androidx.core.app.ActivityCompat;
import android.content.Context;

import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.TimeUnit;

import java.util.Arrays;


public class MyFlutterActivity extends FlutterActivity {
    private static final String CHANNEL_NAME = "flutter.java.channel";
    private MethodChannel methodChannel;
    private static final int PERMISSION_REQUEST_CODE = 10000;
    private static final String NOTIFICATION_CHANNEL_ID = "notification.id";
    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        // Register any plugins if needed
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        methodChannel = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL_NAME);
        methodChannel.setMethodCallHandler((call, result) -> {
                    if (call.method.equals("sendDataToJava")) {
                        // Handle method call from Flutter
//                        String dataToSend = "Hello from Android!";
//                        result.success(dataToSend);
//                        sendDataToFlutter(dataToSend);
                        String data = call.arguments.toString();
                        processDataFromFlutter(data);

                    } else {
                        result.notImplemented();
                    }
                });
    }
    private Reminder[] reminder;
    private void processDataFromFlutter(String data) {
        // Process data received from Flutter
        System.out.println("Data received from Flutter: " + data);
        // Depending on your requirements, you can perform different actions based on the data received.
        Gson gson = new Gson();
        this.reminder = gson.fromJson(data, Reminder[].class);
//        ReminderManager.setReminders(this, Arrays.asList(reminder));
        for (Reminder medicine : reminder) {
            long delayMillis = TimeUnit.SECONDS.toMillis(5);
            createNotification(this, medicine,delayMillis );
            System.out.println("Name: " + medicine.getName());
            System.out.println("Amount: " + medicine.getAmount());
            System.out.println("Times per day: " + medicine.getTimesPerDay());
            System.out.println("Quantity: " + medicine.getQuantity());
        }
    }

    private void sendDataToFlutter(String data) {
        // Send data from Java to Flutter
        methodChannel.invokeMethod("receiveDataFromJava", data);
        System.out.println("Data sent to Flutter: " + data);
    }

    private void createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            CharSequence name = "High priority notifications";
            String description = "Channel for high priority notifications";
            int importance = NotificationManager.IMPORTANCE_HIGH;
            NotificationChannel channel = new NotificationChannel(NOTIFICATION_CHANNEL_ID, name, importance);
            channel.setDescription(description);

            NotificationManager notificationManager = getSystemService(NotificationManager.class);
            notificationManager.createNotificationChannel(channel);
        }
    }

//    private void createNotification(Reminder reminder) {
//        // Create a notification channel for Android Oreo and above
//        createNotificationChannel();
//
//        // Build the notification
//        Notification notification = new Notification.Builder(this, NOTIFICATION_CHANNEL_ID)
//                .setContentTitle(reminder.getName())
//                .setContentText(reminder.getAmount())
//                .setSmallIcon(R.drawable.notification_icon)
//                .build();
//
//        // Display the notification
//        NotificationManager notificationManager =
//                (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
//        notificationManager.notify(1, notification); // Use a unique notification id
//    }

    private static void createNotificationChannel(Context context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            CharSequence name = "High priority notifications";
            String description = "Channel for high priority notifications";
            int importance = NotificationManager.IMPORTANCE_HIGH;
            NotificationChannel channel = new NotificationChannel(NOTIFICATION_CHANNEL_ID, name, importance);
            channel.setDescription(description);

            NotificationManager notificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            notificationManager.createNotificationChannel(channel);
        }
    }

    public static void createNotification(Context context, Reminder reminder, long delayMillis) {
        // Create a notification channel for Android Oreo and above
        createNotificationChannel(context);

        // Delay the creation and display of the notification
        new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
            @Override
            public void run() {
                // Build the notification
                Notification notification = new Notification.Builder(context, NOTIFICATION_CHANNEL_ID)
                        .setContentTitle(reminder.getName())
                        .setContentText(reminder.getAmount())
                        .setSmallIcon(R.drawable.notification_icon)
                        .build();

                // Display the notification
                NotificationManager notificationManager =
                        (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
                notificationManager.notify(1, notification); // Use a unique notification id
            }
        }, delayMillis);
    }

    private void showPermissionDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Permission Required")
                .setMessage("This app requires some permissions to function properly.")
                .setPositiveButton("Allow", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        ActivityCompat.requestPermissions(MyFlutterActivity.this,
                                new String[]{Manifest.permission.VIBRATE, Manifest.permission.RECEIVE_BOOT_COMPLETED,
                                        Manifest.permission.WAKE_LOCK, Manifest.permission.POST_NOTIFICATIONS,
                                        Manifest.permission.SCHEDULE_EXACT_ALARM},
                                PERMISSION_REQUEST_CODE);
                    }
                })
                .setNegativeButton("Deny", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        // Handle denial, possibly show a message to the user
                    }
                })
                .setCancelable(false)
                .show();
    }

    private void requestPermissionsIfNeeded() {
        // Check if permissions are already granted
        if (ContextCompat.checkSelfPermission(this,
                Manifest.permission.VIBRATE) != PackageManager.PERMISSION_GRANTED ||
                ContextCompat.checkSelfPermission(this,
                        Manifest.permission.RECEIVE_BOOT_COMPLETED) != PackageManager.PERMISSION_GRANTED ||
                ContextCompat.checkSelfPermission(this,
                        Manifest.permission.WAKE_LOCK) != PackageManager.PERMISSION_GRANTED ||
                ContextCompat.checkSelfPermission(this, Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED ||
                ContextCompat.checkSelfPermission(this, Manifest.permission.SCHEDULE_EXACT_ALARM) != PackageManager.PERMISSION_GRANTED){
            // Request permissions
            showPermissionDialog();
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        createNotificationChannel();

        // Request permissions if not granted
        requestPermissionsIfNeeded();

        // Access the FlutterEngine to configure it
        FlutterEngine flutterEngine = new FlutterEngine(this);
        flutterEngine.getDartExecutor().executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
        );

        configureFlutterEngine(flutterEngine);

    }
}
