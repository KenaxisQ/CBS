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

Future<String> insertRealestate(
    String? offerType,
    String? propertyType,
    String? propertyDetails,
    String? propertyAddress,
    String? userId,
    String? referrer) async {
  final supabase = Supabase.instance.client;

  // Validation checks
  if (offerType == null || offerType.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'Offer Type is required.',
    });
  }

  if (propertyType == null || propertyType.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'Property Type is required.',
    });
  }

  if (propertyDetails == null || propertyDetails.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'Property Details is required.',
    });
  }

  if (propertyAddress == null || propertyAddress.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'Property Address field is required.',
    });
  }

  if (userId == null || userId.isEmpty) {
    return jsonEncode({
      'success': false,
      'message': 'User ID is required.',
    });
  }

  try {
    // Insert into the "REALESTATE" table
    final response = await supabase.from('REALESTATE').insert([
      {
        'offer_type': offerType,
        'property_type': propertyType,
        'property_details': propertyDetails,
        'property_address': propertyAddress,
        'user_id': userId, // Foreign key reference to the user
        'created_at': DateTime.now().toIso8601String(), // Set created_at
      }
    ]).select(); // `.select()` is required for finalizing insert

    // Check if there was an error in the response
    if (response != null && response.isNotEmpty) {
      final propertyId = response[0]
          ['id']; // Assuming 'id' is the primary key of REALESTATE table

      // Insert into the "USER REQUESTS" table after successful REALESTATE insertion
      final response1 = await supabase.from('USER REQUESTS').insert([
        {
          'type': "REALESTATE",
          'request_id': propertyId, // The id from the REALESTATE table
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
          'message': 'Realestate data and user request inserted successfully.',
        });
      } else {
        // If USER REQUEST insertion fails
        return jsonEncode({
          'success': false,
          'message': 'Failed to insert USER REQUESTS data.',
        });
      }
    } else {
      // If REALESTATE insertion fails
      return jsonEncode({
        'success': false,
        'message': 'Failed to insert Realestate data.',
      });
    }
  } catch (error) {
    print("Error during Realestate insertion: $error");
    final exceptionResponse = {
      'success': false,
      'message': error.toString(),
    };
    return jsonEncode(exceptionResponse); // Convert map to JSON string
  }
}
