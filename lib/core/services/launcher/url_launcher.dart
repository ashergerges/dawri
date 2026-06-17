import 'dart:developer';
import 'package:dawri/core/utils/enums/link_type.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  UrlLauncher._();

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  static Future<void> openGoogleMapWithDic(double lat, double lang) async {
    final Uri callUri = Uri(
      scheme: 'https',
      host: 'www.google.com',
      path: '/maps/dir/',
      queryParameters: {'api': '1', 'destination': '$lat,$lang'},
    );

    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      throw 'Could not launch Google Maps with destination: $lat, $lang';
    }
  }

  static Future<void> handleGoogleMaps(String url) async {
    final uri = Uri.parse(url);

    final destination = uri.queryParameters["destination"];
    if (destination != null) {
      final parts = destination.split(",");
      if (parts.length == 2) {
        final lat = double.tryParse(parts[0]) ?? 0.0;
        final lng = double.tryParse(parts[1]) ?? 0.0;
        openGoogleMapWithDic(lat, lng);
        return;
      }
    }

    // fallback
    UrlLauncher.openWebInApp(url);
  }

  static Future<void> openWebInApp(String url) async {
    final Uri callUri = Uri.parse(url);
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> email(String emailAddress) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: emailAddress);

    // Debug print for URI
    log('Trying to launch: $emailUri');

    if (await canLaunchUrl(emailUri)) {
      final bool launched = await launchUrl(emailUri);
      if (!launched) {
        throw 'Could not launch email client for $emailAddress';
      }
    } else {
      throw 'Could not launch email client for $emailAddress';
    }
  }

  static Future<void> shareToWhatsApp(String phoneNumber,{String? message}) async {
    final url = 'https://wa.me/$phoneNumber?text=${Uri.encodeFull(message??"")}';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }

  static LinkType detectLinkType(String url) {
    final uri = Uri.parse(url);

    if (url.startsWith("tel:")) return LinkType.phone;
    if (url.startsWith("mailto:")) return LinkType.email;
    if (uri.host.contains("wa.me") || uri.host.contains("whatsapp.com")) {
      return LinkType.whatsapp;
    }
    if (uri.host.contains("google.com") && uri.path.contains("maps")) {
      return LinkType.googleMaps;
    }

    return LinkType.other;
  }
}
