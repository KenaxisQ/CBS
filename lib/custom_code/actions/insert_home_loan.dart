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

Future<String> insertHomeLoan(
  String? mode,
  String? type,
  bool? registration,
  String? occupation,
  String? otherLoans,
  String? cibil,
  double? loanAmount,
  String? userId,
  String? referrer,
) async {
  final supabase = Supabase.instance.client;

  // Validation checks
  if (mode == null || mode.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'Mode is required.',
    });
  }

  if (type == null || type.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'Type is required.',
    });
  }

  if (registration == null) {
    return jsonEncode({
      'success': false,
      'message': 'Registration status is required.',
    });
  }

  if (occupation == null || occupation.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'Occupation is required.',
    });
  }

  if (otherLoans == null || otherLoans.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'Other loans field is required.',
    });
  }

  // CIBIL score validation
  if (cibil != null && cibil.isNotEmpty) {
    try {
      // Try converting CIBIL score to an integer
      int cibilScore = int.parse(cibil);

      // Check if the CIBIL score is within the valid range
      if (cibilScore < 300 || cibilScore > 900) {
        return jsonEncode({
          'success': false,
          'message': 'CIBIL score must be between 300 and 900.',
        });
      }
    } catch (e) {
      // If parsing fails, return an error response
      return jsonEncode({
        'success': false,
        'message': 'CIBIL score must be a valid integer.',
      });
    }
  }

  if (loanAmount == null || loanAmount <= 0) {
    return jsonEncode({
      'success': false,
      'message': 'Loan amount must be a positive number.',
    });
  }

  if (userId == null || userId.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'User ID is required.',
    });
  }

  try {
    // Insert into the "HOUSE LOAN" table
    final response = await supabase.from('HOUSE LOAN').insert([
      {
        'mode': mode,
        'type': type,
        'registeration': registration,
        'occupation': occupation,
        'other_loans': otherLoans,
        'cibil': cibil,
        'loan_amount': loanAmount,
        'user_id': userId, // Foreign key reference to the user
        'created_at': DateTime.now().toIso8601String(), // Set created_at
      }
    ]).select(); // `.select()` is required for finalizing insert

    // Check if there was an error in the response
    if (response != null && response.isNotEmpty) {
      final loanId = response[0]
          ['id']; // Assuming 'id' is the primary key of HOUSE LOAN table

      // Insert into the "USER REQUESTS" table after successful HOUSE LOAN insertion
      final response1 = await supabase.from('USER REQUESTS').insert([
        {
          'type': "HOUSE LOAN",
          'request_id': loanId, // The id from the HOUSE LOAN table
          'user_id': userId, // Foreign key reference to the user
          'status': "Submitted",
          'reffered_by': referrer,
          'created_at': DateTime.now().toIso8601String(), // Set created_at
        }
      ]).select();

      if (response1 != null && response1.isNotEmpty) {
        // If USER REQUEST insertion is successful
        return jsonEncode({
          'success': true,
          'message': 'Home Loan data and user request inserted successfully.',
        });
      } else {
        // If USER REQUEST insertion fails
        return jsonEncode({
          'success': false,
          'message': 'Failed to insert USER REQUESTS data.',
        });
      }
    } else {
      // If HOUSE LOAN insertion fails
      return jsonEncode({
        'success': false,
        'message': 'Failed to insert Home Loan data.',
      });
    }
  } catch (error) {
    print("Error during Home Loan insertion: $error");
    final exceptionResponse = {
      'success': false,
      'message': error.toString(),
    };
    return jsonEncode(exceptionResponse); // Convert map to JSON string
  }
}
