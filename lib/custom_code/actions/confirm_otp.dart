// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<String> confirmOtp(
  String? token,
  String? phone,
) async {
  final supabase = Supabase.instance.client;

  // Validation checks
  if (token == null || token.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'OTP token is required.',
    });
  }

  if (phone == null || phone.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'Phone number is required.',
    });
  }

  try {
    // Verify OTP using Supabase
    final response = await supabase.auth.verifyOTP(
      type: OtpType.sms,
      token: token,
      phone: phone,
    );

    // Fetch the current user after OTP verification
    final user = supabase.auth.currentUser;

    if (user != null) {
      final userId = user.id; // Get the current user's ID

      // Check if the user already exists in the USER ROLES table
      final existingRoleResponse = await supabase
          .from('USER ROLES')
          .select('id')
          .eq('user_id', userId)
          .maybeSingle(); // Use maybeSingle to handle no rows or multiple rows

      if (existingRoleResponse == null) {
        // If no rows are returned, insert the user role into the USER ROLES table
        final roleResponse = await supabase.from('USER ROLES').insert([
          {
            'user_id': userId, // Assign the current user's ID
            'role': 'user', // Set the default role to 'user'
            'created_at': DateTime.now().toIso8601String(), // Set created_at
          }
        ]).select();

        if (roleResponse != null && roleResponse.isNotEmpty) {
          // If role insertion is successful
          final successResponse = {
            'success': true,
            'message': 'OTP verified and user role assigned successfully.',
          };
          return jsonEncode(successResponse); // Return success response
        } else {
          // If role insertion fails
          final errorResponse = {
            'success': false,
            'message': 'Failed to assign user role.',
          };
          return jsonEncode(
              errorResponse); // Return error response for role insertion failure
        }
      } else {
        // If the user already has a role assigned
        return jsonEncode({
          'success': true,
          'message': 'User already exists in USER ROLES.',
        });
      }
    } else {
      // If user is not found or OTP verification fails
      final errorResponse = {
        'success': false,
        'message': 'Failed to verify OTP or user not found.',
      };
      return jsonEncode(errorResponse); // Return error response
    }
  } catch (error) {
    print("Error during OTP verification or role assignment: $error");
    final exceptionResponse = {
      'success': false,
      'message': error.toString(),
    };
    return jsonEncode(
        exceptionResponse); // Return error response for exceptions
  }
}
