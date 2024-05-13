import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/refills.dart';
import 'pages/add_refill.dart';
import 'pages/add_medicine.dart';
import 'pages/medicine_reminder.dart';
import 'pages/appointments.dart';
import 'pages/add_appointment.dart';
import 'pages/mealpl_p1.dart';
import 'pages/health_p1.dart';
import 'pages/quiz.dart';
import 'pages/reminders.dart';
import 'pages/disclaimer.dart';
import 'pages/translation.dart';
import 'pages/healthData.dart';
import 'pages/heartwise.dart';
import 'pages/nutrition.dart';
import 'pages/calculate.dart';

void main() {
  runApp(MaterialApp(
    title: 'EldorFit',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
      ),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => MyHomePage(),
      '/refills': (context) => Refills(),
      '/add_refill': (context) => AddRefill(),
      '/appointments': (context) => Appointments(),
      '/add_appointment': (context) => AddAppointment(),
      '/medicines': (context) => MedicineReminders(),
      '/add_medicine': (context) => AddMedicine(),
      '/mealpl_p1': (context) => MealPlanPage1(),
      '/health_p1': (context) => HealthPage(),
      '/quiz': (context) => QuizPage(),
      '/reminders': (context) => ReminderPage(),
      '/disclaimer': (context) => DisclaimerPage(),
      '/translation': (context) => TranslationPage(),
      '/health_data': (context) => DataVisualizer(),
      '/heartwise': (context) => HeartWisePage(),
      '/nutrition': (context) => NutritionPage(),
      '/calculate': (context) => CalorieCalculatorPage(),
    },
  ));
}
