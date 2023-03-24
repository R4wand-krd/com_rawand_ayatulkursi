import 'about.dart';
import 'general.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _isRTL = false;
  String _pageTitleSetting = 'Settings';
  String _pageTitleGeneral = 'General';
  String _pageSubTitleGeneral = 'Latest Version, Dark Mode';
  String _pageTitleAbout = 'About';
  String _pageAubTitleAbout = 'Version, Releases, Developer';

  @override
  void initState() {
    super.initState();
    _loadText();
  }

  Future<void> _loadText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _pageTitleSetting = prefs.getString('pageTileSetting') ?? 'Setting';
      _pageTitleGeneral = prefs.getString('pageTitleGeneral') ?? 'General';
      _pageSubTitleGeneral =
          prefs.getString('pageSubTitleGeneral') ?? 'Latest Version, Dark Mode';
      _pageTitleAbout = prefs.getString('pageTitleAbout') ?? 'About';
      _pageAubTitleAbout = prefs.getString('pageAubTitleAbout') ??
          'Version, Releases, Developer';

      _isRTL = prefs.getString('language') == 'ar' ||
          prefs.getString('language') == 'ckb';
    });
  }

  Widget settingList({
    required String title,
    required String text,
    required IconData icon,
  }) =>
      Container(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22,
            ),
            const SizedBox(width: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    letterSpacing: 0.0,
                    fontFamily: _isRTL ? 'Sahel' : 'Google',
                  ),
                ),
                Text(
                  text,
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
      );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar.large(
            scrolledUnderElevation: 0,
            title: Text(
              _pageTitleSetting,
              style: TextStyle(
                letterSpacing: 0.0,
                fontFamily: _isRTL ? 'Sahel' : 'Google',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Scaffold(
                body: Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GeneralPage(),
                        ),
                      ),
                      child: settingList(
                        title: _pageTitleGeneral,
                        text: _pageSubTitleGeneral,
                        icon: Icons.settings_applications,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutPage(),
                        ),
                      ),
                      child: settingList(
                        title: _pageTitleAbout,
                        text: _pageAubTitleAbout,
                        icon: Icons.info,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
