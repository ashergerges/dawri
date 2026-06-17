
import 'dart:developer';

import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> checkInternetConnection() async {
  return InternetConnectionChecker().hasConnection.then((value) {
   log("value:: $value");
    return value;
  });
}