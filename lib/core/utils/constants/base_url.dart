import 'package:flutter/services.dart';

class BaseUrl {
  static const devBaseURL = 'https://api-dawry.sanam-ksa.com/';
  static const prodBaseURL = 'https://api-dawry.sanam-ksa.com/';
  static const uatBaseURL =  'https://api-dawry.sanam-ksa.com/';
  static const qcBaseURL =  'https://api-dawry.sanam-ksa.com/';

  // Static method to get the BaseUrl based on appFlavor
  static String get url {
    switch (appFlavor?.toUpperCase() ?? "") {
      case "PROD":
        return prodBaseURL;
      case "DEV":
        return devBaseURL;
      case "UAT":
        return uatBaseURL;
      case "QC":
        return qcBaseURL;
      default:
        return prodBaseURL;
    }
  }
}
