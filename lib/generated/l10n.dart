// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Data parsing failed.`
  String get error_data_parsing_failed {
    return Intl.message(
      'Data parsing failed.',
      name: 'error_data_parsing_failed',
      desc: '',
      args: [],
    );
  }

  /// ` Please try again later.`
  String get error_try_again {
    return Intl.message(
      ' Please try again later.',
      name: 'error_try_again',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred.`
  String get error_unknown {
    return Intl.message(
      'An unexpected error occurred.',
      name: 'error_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Під час запиту сталася непередбачена помилка. `
  String get error_api_unknown {
    return Intl.message(
      'Під час запиту сталася непередбачена помилка. ',
      name: 'error_api_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong with your request.`
  String get error_bad_request_400 {
    return Intl.message(
      'Something went wrong with your request.',
      name: 'error_bad_request_400',
      desc: '',
      args: [],
    );
  }

  /// `You need to be authorized to access this resource. Please log in or sign up.`
  String get error_unauthorized_password_401 {
    return Intl.message(
      'You need to be authorized to access this resource. Please log in or sign up.',
      name: 'error_unauthorized_password_401',
      desc: '',
      args: [],
    );
  }

  /// `You don't have access to this resource.`
  String get error_forbidden_403 {
    return Intl.message(
      'You don\'t have access to this resource.',
      name: 'error_forbidden_403',
      desc: '',
      args: [],
    );
  }

  /// `We couldn't find what you're looking for.`
  String get error_not_found_404 {
    return Intl.message(
      'We couldn\'t find what you\'re looking for.',
      name: 'error_not_found_404',
      desc: '',
      args: [],
    );
  }

  /// `Oops! We're having some technical difficulties.`
  String get error_internal_server_500 {
    return Intl.message(
      'Oops! We\'re having some technical difficulties.',
      name: 'error_internal_server_500',
      desc: '',
      args: [],
    );
  }

  /// `There's a problem with the server.`
  String get error_bad_gateway_502 {
    return Intl.message(
      'There\'s a problem with the server.',
      name: 'error_bad_gateway_502',
      desc: '',
      args: [],
    );
  }

  /// `Data loading failed. Check your internet connection.`
  String get error_data_loading_failed {
    return Intl.message(
      'Data loading failed. Check your internet connection.',
      name: 'error_data_loading_failed',
      desc: '',
      args: [],
    );
  }

  /// `Connection to the server timed out. Please check your internet connection or try again later.`
  String get error_connection_timeout {
    return Intl.message(
      'Connection to the server timed out. Please check your internet connection or try again later.',
      name: 'error_connection_timeout',
      desc: '',
      args: [],
    );
  }

  /// `There was an issue sending data. Please check your internet connection or try again later.`
  String get error_send_timeout {
    return Intl.message(
      'There was an issue sending data. Please check your internet connection or try again later.',
      name: 'error_send_timeout',
      desc: '',
      args: [],
    );
  }

  /// `There was an issue receiving data. Please check your internet connection or try again later.`
  String get error_receive_timeout {
    return Intl.message(
      'There was an issue receiving data. Please check your internet connection or try again later.',
      name: 'error_receive_timeout',
      desc: '',
      args: [],
    );
  }

  /// `The website's security certificate might be invalid. Contact the website owner for help.`
  String get error_bad_certificate {
    return Intl.message(
      'The website\'s security certificate might be invalid. Contact the website owner for help.',
      name: 'error_bad_certificate',
      desc: '',
      args: [],
    );
  }

  /// `The website didn't send us a valid response.`
  String get error_bad_response {
    return Intl.message(
      'The website didn\'t send us a valid response.',
      name: 'error_bad_response',
      desc: '',
      args: [],
    );
  }

  /// `The request was cancelled.`
  String get error_api_cancel {
    return Intl.message(
      'The request was cancelled.',
      name: 'error_api_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't connect to the server. Check your internet connection.`
  String get error_connection_error {
    return Intl.message(
      'Couldn\'t connect to the server. Check your internet connection.',
      name: 'error_connection_error',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection.`
  String get error_network_connection_failed {
    return Intl.message(
      'Check your internet connection.',
      name: 'error_network_connection_failed',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address.`
  String get error_invalid_email_format {
    return Intl.message(
      'Please enter a valid email address.',
      name: 'error_invalid_email_format',
      desc: '',
      args: [],
    );
  }

  /// `The passwords you entered don't match.`
  String get error_validation_password_mismatch {
    return Intl.message(
      'The passwords you entered don\'t match.',
      name: 'error_validation_password_mismatch',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number.`
  String get error_invalid_phone_number_format {
    return Intl.message(
      'Please enter a valid phone number.',
      name: 'error_invalid_phone_number_format',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid username.`
  String get error_invalid_username_format {
    return Intl.message(
      'Please enter a valid username.',
      name: 'error_invalid_username_format',
      desc: '',
      args: [],
    );
  }

  /// `The user was not found.`
  String get error_user_not_found {
    return Intl.message(
      'The user was not found.',
      name: 'error_user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `This email address is already in use.`
  String get error_email_already_in_use {
    return Intl.message(
      'This email address is already in use.',
      name: 'error_email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `This username is already in use.`
  String get error_username_already_in_use {
    return Intl.message(
      'This username is already in use.',
      name: 'error_username_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `The verification code is invalid.`
  String get error_invalid_verification_code {
    return Intl.message(
      'The verification code is invalid.',
      name: 'error_invalid_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `The verification code has expired.`
  String get error_verification_code_expired {
    return Intl.message(
      'The verification code has expired.',
      name: 'error_verification_code_expired',
      desc: '',
      args: [],
    );
  }

  /// `Your account has not been activated yet. Please check your email for the activation link.`
  String get error_account_not_activated {
    return Intl.message(
      'Your account has not been activated yet. Please check your email for the activation link.',
      name: 'error_account_not_activated',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been blocked. Please contact support for help.`
  String get error_account_blocked {
    return Intl.message(
      'Your account has been blocked. Please contact support for help.',
      name: 'error_account_blocked',
      desc: '',
      args: [],
    );
  }

  /// `Too many login attempts.`
  String get error_too_many_login_attempts {
    return Intl.message(
      'Too many login attempts.',
      name: 'error_too_many_login_attempts',
      desc: '',
      args: [],
    );
  }

  /// `Password reset failed.`
  String get error_password_reset_failed {
    return Intl.message(
      'Password reset failed.',
      name: 'error_password_reset_failed',
      desc: '',
      args: [],
    );
  }

  /// `The token is invalid.`
  String get error_invalid_token {
    return Intl.message(
      'The token is invalid.',
      name: 'error_invalid_token',
      desc: '',
      args: [],
    );
  }

  /// `The token has expired.`
  String get error_token_expired {
    return Intl.message(
      'The token has expired.',
      name: 'error_token_expired',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired. Please log in again.`
  String get error_session_expired {
    return Intl.message(
      'Your session has expired. Please log in again.',
      name: 'error_session_expired',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
