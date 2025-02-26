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

Future<String> insertBussinessLoan(
  String? mode,
  String? type,
  String? bussinessType,
  String? otherLoans,
  String? cibil,
  double? loanAmount,
  String? userId,
  String? requiredLoan,
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
      'message': 'Loan Type is required.',
    });
  }

  if (bussinessType == null || bussinessType.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'Bussiness Type is required.',
    });
  }

  if (otherLoans == null || otherLoans.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'Other loans field is required.',
    });
  }

  if (requiredLoan == null || requiredLoan.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'Required Loan field is required.',
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
    // Insert into the "Bussiness Loan" table
    final response = await supabase.from('BUSSINESS LOAN').insert([
      {
        'mode': mode,
        'loan_type': type,
        'bussiness_type': bussinessType,
        'other_loans': otherLoans,
        'cibil': cibil,
        'loan_amount': loanAmount,
        'required_loan': requiredLoan,
        'user_id': userId, // Foreign key reference to the user
        'created_at': DateTime.now().toIso8601String(), // Set created_at
      }
    ]).select(); // `.select()` is required for finalizing insert

    if (response == null || response.isEmpty) {
      // If there's no response or an error, return a failure message
      return jsonEncode({
        'success': false,
        'message': 'Failed to insert Bussiness Loan data.',
      });
    }

    // Insert into "USER REQUESTS" table if Bussiness Loan was successful
    try {
      final response1 = await supabase.from('USER REQUESTS').insert([
        {
          'type': "BUSSINESS LOAN",
          'request_id': response[0]
              ['id'], // Assuming response contains an 'id' field
          'user_id': userId, // Foreign key reference to the user
          'status': "Submitted",
          'reffered_by': referrer,
          'created_at': DateTime.now().toIso8601String(), // Set created_at
        }
      ]).select();

      if (response1 == null || response1.isEmpty) {
        // If USER REQUEST insertion fails
        return jsonEncode({
          'success': false,
          'message': 'Failed to insert USER REQUESTS data.',
        });
      }

      // If both insertions are successful
      return jsonEncode({
        'success': true,
        'message':
            'Bussiness Loan data and user request inserted successfully.',
      });
    } catch (error) {
      print("Error during USER REQUESTS insertion: $error");
      return jsonEncode({
        'success': false,
        'message': 'Error inserting into USER REQUESTS table.',
      });
    }
  } catch (error) {
    print("Error during Bussiness Loan insertion: $error");
    return jsonEncode({
      'success': false,
      'message': error.toString(),
    });
  }
}
