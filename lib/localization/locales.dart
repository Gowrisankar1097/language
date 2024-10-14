
import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale>LOCALE=[
  MapLocale('en', AppLocale.EN),
  MapLocale('ta', AppLocale.TA),
  MapLocale('hi', AppLocale.HI),
];

mixin AppLocale{

  static const String appBarTitle = "title";
  static const String headingText = "Header Text";
  static const String bodyText = "Body Text";


  static const Map<String, dynamic> EN ={
    appBarTitle:"App Localization",
    headingText: "Mobile Application",
    bodyText:"This is the demo application on localization"

  };
  static const Map<String, dynamic> TA ={
    appBarTitle:"பயன்பாட்டின் உள்ளூர்மயமாக்கல்",
    headingText: "மொபைல் பயன்பாடு",
    bodyText:"இது உள்ளூர்மயமாக்கலின் டெமோ பயன்பாடு ஆகும்"

  };
  static const Map<String, dynamic> HI ={
    appBarTitle:"ऐप स्थानीयकरण",
    headingText: "मोबाइल एप्लीकेशन",
    bodyText:"यह स्थानीयकरण पर डेमो एप्लिकेशन है"

  };


}