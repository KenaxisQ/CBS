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

Future<bool> logout() async {
  // Add your function code here!
  // Get a reference to your Supabase client
  final supabase = Supabase.instance.client;

  try {
    // Log the user out by calling the signOut() method
    await supabase.auth.signOut();

    // Optionally, clear any stored user data in your app state
    FFAppState().userId = ""; // Reset userId or any other user-related data

    print('User logged out successfully.');
    return true;
  } catch (error) {
    print('Error logging out: $error');
    return false;
  }
}
