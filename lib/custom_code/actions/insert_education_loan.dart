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

Future<String> insertEducationLoan(
    String? education,
    String? loanType,
    String? otherLoans,
    String? cibil,
    double? loanAmount,
    String? userId,
    String? loanMode,
    String? referrer) async {
  final supabase = Supabase.instance.client;

  // Validation checks
  if (education == null || education.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'Education is required.',
    });
  }

  if (loanMode == null || loanMode.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'Loan Mode is required.',
    });
  }

  if (loanType == null || loanType.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'Loan type is required.',
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
    // Insert into the "EDUCATION LOAN" table
    final response = await supabase.from('EDUCATION LOAN').insert([
      {
        'education': education,
        'loan_type': loanType,
        'other_loans': otherLoans,
        'cibil': cibil,
        'loan_amount': loanAmount,
        'user_id': userId, // Foreign key reference to the user
        'created_at': DateTime.now().toIso8601String(), // Set created_at
      }
    ]).select(); // `.select()` is required for finalizing insert

    // Check if the insertion was successful
    if (response != null && response.isNotEmpty) {
      final loanId = response[0]
          ['id']; // Assuming 'id' is the primary key of EDUCATION LOAN table

      // Insert into the "USER REQUESTS" table after successful EDUCATION LOAN insertion
      final response1 = await supabase.from('USER REQUESTS').insert([
        {
          'type': "EDUCATION LOAN",
          'request_id': loanId, // The id from the EDUCATION LOAN table
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
          'message':
              'Education Loan data and user request inserted successfully.',
        });
      } else {
        // If USER REQUEST insertion fails
        return jsonEncode({
          'success': false,
          'message': 'Failed to insert USER REQUESTS data.',
        });
      }
    } else {
      // If EDUCATION LOAN insertion fails
      return jsonEncode({
        'success': false,
        'message': 'Failed to insert Education Loan data.',
      });
    }
  } catch (error) {
    print("Error during Education Loan insertion: $error");
    final exceptionResponse = {
      'success': false,
      'message': error.toString(),
    };
    return jsonEncode(exceptionResponse); // Convert map to JSON string
  }
}
