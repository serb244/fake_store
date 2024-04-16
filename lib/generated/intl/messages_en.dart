// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "error_account_blocked": MessageLookupByLibrary.simpleMessage(
            "Your account has been blocked. Please contact support for help."),
        "error_account_not_activated": MessageLookupByLibrary.simpleMessage(
            "Your account has not been activated yet. Please check your email for the activation link."),
        "error_api_cancel":
            MessageLookupByLibrary.simpleMessage("The request was cancelled."),
        "error_api_unknown": MessageLookupByLibrary.simpleMessage(
            "Під час запиту сталася непередбачена помилка. "),
        "error_bad_certificate": MessageLookupByLibrary.simpleMessage(
            "The website\'s security certificate might be invalid. Contact the website owner for help."),
        "error_bad_gateway_502": MessageLookupByLibrary.simpleMessage(
            "There\'s a problem with the server."),
        "error_bad_request_400": MessageLookupByLibrary.simpleMessage(
            "Something went wrong with your request."),
        "error_bad_response": MessageLookupByLibrary.simpleMessage(
            "The website didn\'t send us a valid response."),
        "error_connection_error": MessageLookupByLibrary.simpleMessage(
            "Couldn\'t connect to the server. Check your internet connection."),
        "error_connection_timeout": MessageLookupByLibrary.simpleMessage(
            "Connection to the server timed out. Please check your internet connection or try again later."),
        "error_data_loading_failed": MessageLookupByLibrary.simpleMessage(
            "Data loading failed. Check your internet connection."),
        "error_data_parsing_failed":
            MessageLookupByLibrary.simpleMessage("Data parsing failed."),
        "error_email_already_in_use": MessageLookupByLibrary.simpleMessage(
            "This email address is already in use."),
        "error_forbidden_403": MessageLookupByLibrary.simpleMessage(
            "You don\'t have access to this resource."),
        "error_internal_server_500": MessageLookupByLibrary.simpleMessage(
            "Oops! We\'re having some technical difficulties."),
        "error_invalid_email_format": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid email address."),
        "error_invalid_phone_number_format":
            MessageLookupByLibrary.simpleMessage(
                "Please enter a valid phone number."),
        "error_invalid_token":
            MessageLookupByLibrary.simpleMessage("The token is invalid."),
        "error_invalid_username_format": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid username."),
        "error_invalid_verification_code": MessageLookupByLibrary.simpleMessage(
            "The verification code is invalid."),
        "error_network_connection_failed": MessageLookupByLibrary.simpleMessage(
            "Check your internet connection."),
        "error_not_found_404": MessageLookupByLibrary.simpleMessage(
            "We couldn\'t find what you\'re looking for."),
        "error_password_reset_failed":
            MessageLookupByLibrary.simpleMessage("Password reset failed."),
        "error_receive_timeout": MessageLookupByLibrary.simpleMessage(
            "There was an issue receiving data. Please check your internet connection or try again later."),
        "error_send_timeout": MessageLookupByLibrary.simpleMessage(
            "There was an issue sending data. Please check your internet connection or try again later."),
        "error_session_expired": MessageLookupByLibrary.simpleMessage(
            "Your session has expired. Please log in again."),
        "error_token_expired":
            MessageLookupByLibrary.simpleMessage("The token has expired."),
        "error_too_many_login_attempts":
            MessageLookupByLibrary.simpleMessage("Too many login attempts."),
        "error_try_again":
            MessageLookupByLibrary.simpleMessage(" Please try again later."),
        "error_unauthorized_password_401": MessageLookupByLibrary.simpleMessage(
            "You need to be authorized to access this resource. Please log in or sign up."),
        "error_unknown": MessageLookupByLibrary.simpleMessage(
            "An unexpected error occurred."),
        "error_user_not_found":
            MessageLookupByLibrary.simpleMessage("The user was not found."),
        "error_username_already_in_use": MessageLookupByLibrary.simpleMessage(
            "This username is already in use."),
        "error_validation_password_mismatch":
            MessageLookupByLibrary.simpleMessage(
                "The passwords you entered don\'t match."),
        "error_verification_code_expired": MessageLookupByLibrary.simpleMessage(
            "The verification code has expired.")
      };
}
