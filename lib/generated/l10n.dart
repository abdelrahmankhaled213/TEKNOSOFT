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

  /// `Create an account`
  String get createemail {
    return Intl.message(
      'Create an account',
      name: 'createemail',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get welcomeback {
    return Intl.message(
      'Welcome back',
      name: 'welcomeback',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get ForgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Name {
    return Intl.message(
      'Name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ?`
  String get Donthaveanaccount {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'Donthaveanaccount',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Sign in' key

  // skipped getter for the 'Sign up' key

  // skipped getter for the 'Sign in with' key

  /// `Enter your email`
  String get Enteryouremail {
    return Intl.message(
      'Enter your email',
      name: 'Enteryouremail',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Sign in with Google' key

  /// `Send`
  String get Send {
    return Intl.message(
      'Send',
      name: 'Send',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Reset Password' key

  /// `Enter your email and we will send you a link to reset your password`
  String get Enteryouremailreset {
    return Intl.message(
      'Enter your email and we will send you a link to reset your password',
      name: 'Enteryouremailreset',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Submit {
    return Intl.message(
      'Submit',
      name: 'Submit',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get Cart {
    return Intl.message(
      'Cart',
      name: 'Cart',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get Orders {
    return Intl.message(
      'Orders',
      name: 'Orders',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the ' Favourites' key

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Darkmode`
  String get Darkmode {
    return Intl.message(
      'Darkmode',
      name: 'Darkmode',
      desc: '',
      args: [],
    );
  }

  /// `All Featured`
  String get AllFeatured {
    return Intl.message(
      'All Featured',
      name: 'AllFeatured',
      desc: '',
      args: [],
    );
  }

  /// `Sales 25 %`
  String get Sales {
    return Intl.message(
      'Sales 25 %',
      name: 'Sales',
      desc: '',
      args: [],
    );
  }

  /// `Sizes`
  String get Sizes {
    return Intl.message(
      'Sizes',
      name: 'Sizes',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get Color {
    return Intl.message(
      'Color',
      name: 'Color',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get Price {
    return Intl.message(
      'Price',
      name: 'Price',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get dlev {
    return Intl.message(
      'Delivery',
      name: 'dlev',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get Add {
    return Intl.message(
      'Add',
      name: 'Add',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get Remove {
    return Intl.message(
      'Remove',
      name: 'Remove',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get Total {
    return Intl.message(
      'Total',
      name: 'Total',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get Checkout {
    return Intl.message(
      'Checkout',
      name: 'Checkout',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get Addtocart {
    return Intl.message(
      'Add to cart',
      name: 'Addtocart',
      desc: '',
      args: [],
    );
  }

  /// `Remove from cart`
  String get Removefromcart {
    return Intl.message(
      'Remove from cart',
      name: 'Removefromcart',
      desc: '',
      args: [],
    );
  }

  /// `Cart is empty`
  String get Cartisempty {
    return Intl.message(
      'Cart is empty',
      name: 'Cartisempty',
      desc: '',
      args: [],
    );
  }

  /// `Favourites is empty`
  String get Favouritesempty {
    return Intl.message(
      'Favourites is empty',
      name: 'Favouritesempty',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get Payment {
    return Intl.message(
      'Payment',
      name: 'Payment',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Total payment' key

  /// `Delivery free`
  String get Delivery {
    return Intl.message(
      'Delivery free',
      name: 'Delivery',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get Quantity {
    return Intl.message(
      'Quantity',
      name: 'Quantity',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Add to favorites' key

  // skipped getter for the 'Remove from favorites' key

  /// `Description`
  String get Description {
    return Intl.message(
      'Description',
      name: 'Description',
      desc: '',
      args: [],
    );
  }

  /// `Sizes`
  String get SIZES {
    return Intl.message(
      'Sizes',
      name: 'SIZES',
      desc: '',
      args: [],
    );
  }

  /// `we well send you a link to reset your password`
  String get sendemail {
    return Intl.message(
      'we well send you a link to reset your password',
      name: 'sendemail',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get Signup {
    return Intl.message(
      'Sign up',
      name: 'Signup',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account ?`
  String get haveaccount {
    return Intl.message(
      'Already have an account ?',
      name: 'haveaccount',
      desc: '',
      args: [],
    );
  }

  /// `تاكيد`
  String get Submitt {
    return Intl.message(
      'تاكيد',
      name: 'Submitt',
      desc: '',
      args: [],
    );
  }

  /// `NoOrderAdded`
  String get NoOrderAdded {
    return Intl.message(
      'NoOrderAdded',
      name: 'NoOrderAdded',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
