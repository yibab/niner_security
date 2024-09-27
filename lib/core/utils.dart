import 'dart:convert';
import 'dart:ui';


import 'package:url_launcher/url_launcher.dart';

urlLaunch(String url) async {
  final Uri toLaunch = Uri.parse(url);
  if (await canLaunchUrl(toLaunch)) {
    await launchUrl(toLaunch);
  } else {
    throw 'Could not launch $url';
  }
}