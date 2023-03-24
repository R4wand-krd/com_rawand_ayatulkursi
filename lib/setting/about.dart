import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool darkMode = false;
  final String _appVersion = "1.2.0";
  bool _isRTL = false;
  String _pageTitleAbout = 'About';
  String _appDescription =
      'This app is created for those who want to read and listen to Ayat Al-Kursi daily.';
  String _appContact = 'Contact developer';
  String _appDeveloper = 'Rawand Ako Khalid';
  String _appDeveloperDescription = 'Web & Mobile App Developer + Designer';
  String _appDeveloperWebsite = 'Website';
  String _appDeveloperInstagram = 'Instagram';
  String _appSponsor = 'Sponsor';
  String _appKhmerTranlator = 'Khmer language translator';
  String _appNewVersion = 'New Version';
  String _appNewVersionCheck = 'Click to check the newest version';
  String _appVersionName = 'Version';

  @override
  void initState() {
    super.initState();
    _loadText();
  }

  Future<void> _loadText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _pageTitleAbout = prefs.getString('pageTitleAbout') ?? 'About';
      _appDescription = prefs.getString('appDescription') ??
          'This app is created for those who want to read and listen to Ayat Al-Kursi daily.';
      _appContact = prefs.getString('appContact') ?? 'Contact developer';
      _appDeveloper = prefs.getString('appDeveloper') ?? 'Rawand Ako Khalid';
      _appDeveloperDescription = prefs.getString('appDeveloperDescription') ??
          'Web & Mobile App Developer + Designer';
      _appDeveloperWebsite =
          prefs.getString('appDeveloperWebsite') ?? 'Website';
      _appDeveloperInstagram =
          prefs.getString('appDeveloperInstagram') ?? 'Instagram';
      _appSponsor = prefs.getString('appSponsor') ?? 'Sponsor';
      _appKhmerTranlator =
          prefs.getString('appKhmerTranlator') ?? 'Khmer language translator';
      _appNewVersion = prefs.getString('appNewVersion') ?? 'New Version';
      _appNewVersionCheck = prefs.getString('appNewVersionCheck') ??
          'Click to check the newst version';
      _appVersionName = prefs.getString('appVersionName') ?? 'Version';

      _isRTL = prefs.getString('language') == 'ar' ||
          prefs.getString('language') == 'ckb';
    });
  }

  Future<void> _checkVersion() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/R4wand-krd/R4wand-krd/main/version.json'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final latestVersion = data['version'];
      if (_appVersion != latestVersion) {
        if (!mounted) return;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            scrollable: true,
            alignment: Alignment.center,
            actionsAlignment: MainAxisAlignment.center,
            icon: const Icon(Icons.new_releases_outlined),
            title: Text('1.4.0'),
            content: Text(
                '# What is Changed\n\n## Added\n* Add ...\n\n## Changed\n- Change ...\n\n## Fixed\n- Fix ...'),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              ),
              FilledButton(
                child: const Text('UPDATE'),
                onPressed: () => launchUrl(
                  Uri.parse('https://r4wand.eu.org/'),
                  mode: LaunchMode.externalApplication,
                ),
              ),
            ],
          ),
        );
      } else {
        if (!mounted) return;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            scrollable: true,
            alignment: Alignment.center,
            actionsAlignment: MainAxisAlignment.center,
            icon: const Icon(Icons.new_releases_outlined),
            title: Text(_appVersion),
            content: Text(
              'You have the latest version',
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_outlined),
          ),
          centerTitle: false,
          title: Text(
            _pageTitleAbout,
            style: TextStyle(
              letterSpacing: 0.0,
              fontFamily: _isRTL ? 'Sahel' : 'Google',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 12.0, right: 12.0, bottom: 12.0),
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/logo.png'),
                      radius: 25,
                    ),
                    const SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ayatul Kursi Offline',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.0,
                            fontFamily: _isRTL ? 'Sahel' : 'Google',
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.6,
                          child: Text(
                            _appDescription,
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 0.0,
                              fontFamily: _isRTL ? 'Sahel' : 'Google',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        OutlinedButton(
                          onPressed: () => launchUrl(
                            Uri.parse('https://r4wand.eu.org/'),
                            mode: LaunchMode.externalApplication,
                          ),
                          child: Text(
                            _appContact,
                            style: TextStyle(
                              letterSpacing: 0.0,
                              fontFamily: _isRTL ? 'Sahel' : 'Google',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 12.0, right: 12.0),
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/rawand.png'),
                      radius: 25,
                    ),
                    const SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _appDeveloper,
                          style: TextStyle(
                            fontSize: 21,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: _isRTL ? 'Sahel' : 'Google',
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Text(
                            _appDeveloperDescription,
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 0.0,
                              fontFamily: _isRTL ? 'Sahel' : 'Google',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Row(
                          children: [
                            OutlinedButton(
                              onPressed: () async => launchUrl(
                                Uri.parse('https://r4wand.eu.org/'),
                                mode: LaunchMode.externalApplication,
                              ),
                              child: Text(
                                _appDeveloperWebsite,
                                style: TextStyle(
                                  letterSpacing: 0.0,
                                  fontFamily: _isRTL ? 'Sahel' : 'Google',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            OutlinedButton(
                              onPressed: () async => launchUrl(
                                Uri.parse('https://instagram.com/de.krd'),
                                mode: LaunchMode.externalApplication,
                              ),
                              child: Text(
                                _appDeveloperInstagram,
                                style: TextStyle(
                                  letterSpacing: 0.0,
                                  fontFamily: _isRTL ? 'Sahel' : 'Google',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async => launchUrl(
                  Uri.parse(
                      'https://play.google.com/store/apps/dev?id=8296089687031805380'),
                  mode: LaunchMode.externalApplication,
                ),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.auto_awesome_outlined,
                        size: 22,
                      ),
                      const SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Innovation Team',
                            style: TextStyle(
                              fontSize: 22,
                              letterSpacing: 0.0,
                              fontFamily: 'Google',
                            ),
                          ),
                          Text(
                            _appSponsor,
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 0.0,
                              fontFamily: _isRTL ? 'Sahel' : 'Google',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async => launchUrl(
                  Uri.parse('https://vithey.blogspot.com/'),
                  mode: LaunchMode.externalApplication,
                ),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.language_outlined,
                        size: 22,
                      ),
                      const SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'YouShow',
                            style: TextStyle(
                              fontSize: 22,
                              letterSpacing: 0.0,
                              fontFamily: 'Google',
                            ),
                          ),
                          Text(
                            _appKhmerTranlator,
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 0.0,
                              fontFamily: _isRTL ? 'Sahel' : 'Google',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => _checkVersion(),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.new_releases_outlined,
                        size: 22,
                      ),
                      const SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _appNewVersion,
                            style: TextStyle(
                              fontSize: 22,
                              letterSpacing: 0.0,
                              fontFamily: _isRTL ? 'Sahel' : 'Google',
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Text(
                              _appNewVersionCheck,
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 0.0,
                                fontFamily: _isRTL ? 'Sahel' : 'Google',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.info_outlined,
                        size: 22,
                      ),
                      const SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _appVersionName,
                            style: TextStyle(
                              fontSize: 22,
                              letterSpacing: 0.0,
                              fontFamily: _isRTL ? 'Sahel' : 'Google',
                            ),
                          ),
                          Text(
                            _appVersion,
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 0.0,
                              fontFamily: 'Google',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
