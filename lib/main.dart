import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_supabase/app_page.dart';
import 'package:login_supabase/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://gmmffqcmxdlrsiumkywi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdtbWZmcWNteGRscnNpdW1reXdpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQzNzAwNDgsImV4cCI6MjA0OTk0NjA0OH0.9DvtXRWBfo_ErBHfuldEeTqIEMGXzuE1SIPHwZoOC-8',
  );

  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppPage(
        supabase: supabase,
      ),
    );
  }
}
