import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:language/localization/locales.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    configuringlocalization();
    super.initState();
  }

  configuringlocalization() {
    localization.init(mapLocales: LOCALE, initLanguageCode: "en");
    localization.onTranslatedLanguage = onTranslatedlanguage;
  }

  onTranslatedlanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      // locale: Locale('ta'),
      home: HomeScreen(
        localization: localization,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  FlutterLocalization localization = FlutterLocalization.instance;

  HomeScreen({super.key, required this.localization});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentlyLocalized = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[ Text(AppLocale.appBarTitle.getString(context),
                style: TextStyle(fontSize: 15), overflow: TextOverflow.ellipsis),]
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                value: currentlyLocalized,
                icon: Icon(Icons.language),
                underline: SizedBox(),
                onChanged: (String? newValue) {
                  setlocal(newValue);
                },
                items: [
                  DropdownMenuItem(value: 'en', child: Text("English")),
                  DropdownMenuItem(value: 'ta', child: Text("Tamil")),
                  DropdownMenuItem(value: 'hi', child: Text("Hindi")),
                ],
                dropdownColor: Colors.white,
              ),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              // context.formatString(AppLocale.headingText, ["Flutter"] ---- adding another text
              AppLocale.headingText.getString(context),
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 300,
            ),
            Center(child: Text(AppLocale.bodyText.getString(context)))
          ],
        ),
      ),
    );
  }
 setlocal(String? value) {
    if (value == null) return;
    if (value == 'en') {
      widget.localization.translate('en');
    } else if (value == 'ta') {
      widget.localization.translate('ta');
    } else if (value == 'hi') {
      widget.localization.translate('hi');
    } else {
      return;
    }
    setState(() {
      currentlyLocalized = value;
    });
  }
}
