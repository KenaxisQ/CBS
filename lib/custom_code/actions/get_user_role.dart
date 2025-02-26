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

Future<String?> getUserRole(String userId) async {
  // Get a reference to your Supabase client
  final supabase = Supabase.instance.client;

  try {
    // Get the current session and user
    final user = supabase.auth.currentUser;

    if (user != null) {
      // Query the "users" table to fetch the role of the current user using their user ID
      final response = await supabase
          .from(
              'USER ROLES') // Assuming the user details are in the "users" table
          .select('role') // Select the "role" field
          .eq('id', user.id) // Filter by the user's ID
          .single(); // Assuming there's only one row for each user

      if (response != null) {
        // Return the role if the response is valid
        return response['role'];
      } else {
        // If no role is found or an error occurs
        return null;
      }
    } else {
      // If the user is not authenticated
      print('User is not signed in.');
      return null;
    }
  } catch (error) {
    print('Error fetching user role: $error');
    return null; // Return null in case of an error
  }
}
