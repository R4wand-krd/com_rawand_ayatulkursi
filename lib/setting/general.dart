import 'package:flutter/material.dart';
import 'package:com_rawand_ayatulkursi/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({super.key});

  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  bool darkMode = false;
  bool _isRTL = false;
  String _pageTitleGeneral = 'General';
  String _lastVersionGeneral = 'Latest Version';
  String _lastVersionDateGeneral = '24.03.2023';
  String _darkModeGeneral = 'Dark Mode';

  @override
  void initState() {
    super.initState();
    _loadText();
    _checkDarkMode();
  }

  Future<void> _loadText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _pageTitleGeneral = prefs.getString('pageTitleGeneral') ?? 'General';
      _lastVersionGeneral =
          prefs.getString('lastVersionGeneral') ?? 'Latest Version';
      _lastVersionDateGeneral =
          prefs.getString('lastVersionDateGeneral') ?? '24.03.2023';
      _darkModeGeneral = prefs.getString('darkModeGeneral') ?? 'Dark Mode';

      _isRTL = prefs.getString('language') == 'ar' ||
          prefs.getString('language') == 'ckb';
    });
  }

  Future<void> _checkDarkMode() async {
    if (AyatulKursi.themeSwitch.value == ThemeMode.light) {
      darkMode = false;
    } else {
      darkMode = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            _pageTitleGeneral,
            style: TextStyle(
              letterSpacing: 0.0,
              fontFamily: _isRTL ? 'Sahel' : 'Google',
            ),
          ),
        ),
        body: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.update_outlined,
                      size: 22,
                    ),
                    const SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _lastVersionGeneral,
                          style: TextStyle(
                            fontSize: 22,
                            letterSpacing: 0.0,
                            fontFamily: _isRTL ? 'Sahel' : 'Google',
                          ),
                        ),
                        Text(
                          _lastVersionDateGeneral,
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
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.dark_mode_outlined,
                        size: 22,
                      ),
                      const SizedBox(width: 12.0),
                      Text(
                        _darkModeGeneral,
                        style: TextStyle(
                          fontSize: 22,
                          letterSpacing: 0.0,
                          fontFamily: _isRTL ? 'Sahel' : 'Google',
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: darkMode,
                    onChanged: (bool value) {
                      setState(() {
                        darkMode = value;
                      });
                      if (darkMode) {
                        if (AyatulKursi.themeSwitch.value == ThemeMode.light) {
                          AyatulKursi.themeSwitch.value = ThemeMode.dark;
                        } else if (AyatulKursi.themeSwitch.value ==
                            ThemeMode.dark) {
                          AyatulKursi.themeSwitch.value = ThemeMode.light;
                        } else if (AyatulKursi.themeSwitch.value ==
                            ThemeMode.system) {
                          AyatulKursi.themeSwitch.value = ThemeMode.dark;
                        } else if (AyatulKursi.themeSwitch.value ==
                            ThemeMode.system) {
                          AyatulKursi.themeSwitch.value = ThemeMode.light;
                        }
                      } else {
                        AyatulKursi.themeSwitch.value = ThemeMode.light;
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
