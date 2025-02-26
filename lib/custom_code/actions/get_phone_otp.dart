// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future<String> getPhoneOtp(String phone) async {
  // Get a reference to your Supabase client
  final supabase = Supabase.instance.client;

  try {
    await supabase.auth.signInWithOtp(
      phone: "91" + phone,
      shouldCreateUser: true,
    );

    return "true";
  } catch (e) {
    // Handle any unexpected errors
    print('An error occurred: $e');
    return '$e';
  }
}
