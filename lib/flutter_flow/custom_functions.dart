import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

bool? isValidPhoneNumber(String? phoneNumber) {
// return phoneNumber.length== 10?true:false;
  return phoneNumber?.length == 10 ? true : false;
}

bool? checkIfSuccess(String response) {
  if (response == null) {
    return false;
  }

  // Decode the JSON string response
  final parsedResponse = jsonDecode(response);

  // Check if the 'success' key is present and its value is true
  return parsedResponse['success'] == true;
}

String? extractMessageForJSONResponse(String jsonResponse) {
  try {
    // Parse the JSON response string
    final Map<String, dynamic> response = jsonDecode(jsonResponse);

    // Check if the response contains the key 'message'
    if (response.containsKey('message')) {
      // Return the value associated with the 'message' key
      return response['message'];
    } else {
      // If the 'message' key is not present, return a default message
      return 'No message found in the response.';
    }
  } catch (e) {
    // If the JSON decoding fails, return a default error message
    return 'Error decoding the JSON response.';
  }
}
