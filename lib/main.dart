import 'home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();

  runApp(AyatulKursi());
}

class AyatulKursi extends StatelessWidget {
  const AyatulKursi({super.key});

  static final ValueNotifier<ThemeMode> themeSwitch =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeSwitch,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.light().copyWith(
              // Primary
              primary: Color(0xFF984063),
              onPrimary: Color(0xFFffffff),
              primaryContainer: Color(0xFFffd9e5),
              onPrimaryContainer: Color(0xFF3f001e),

              // Secondary
              secondary: Color(0xFF74565f),
              onSecondary: Color(0xFFffffff),
              secondaryContainer: Color(0xFFffd9e3),
              onSecondaryContainer: Color(0xFF2b151d),

              // Tertiary
              tertiary: Color(0xFF7d5635),
              onTertiary: Color(0xFFffffff),
              tertiaryContainer: Color(0xFFffdcc0),
              onTertiaryContainer: Color(0xFF2f1500),

              // Error
              error: Color(0xFFba1b1b),
              onError: Color(0xFFffffff),
              errorContainer: Color(0xFFffdad4),
              onErrorContainer: Color(0xFF410001),

              // Background
              background: Color(0xFFfcfcfc),
              onBackground: Color(0xFF1f1a1b),
              surface: Color(0xFFfcfcfc),
              onSurface: Color(0xFF1f1a1b),
              surfaceVariant: Color(0xFFf2dee2),
              onSurfaceVariant: Color(0xFF514347),

              // Outline
              outline: Color(0xFF837377),
              shadow: Color(0xFF000000),
              inverseSurface: Color(0xFF352f30),
              onInverseSurface: Color(0xFFfaeeef),
              inversePrimary: Color(0xFFffb0cb),

              // Other
            ),
            fontFamily: 'Google',
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.dark().copyWith(
              // Primary
              primary: Color(0xFFffb0cb),
              onPrimary: Color(0xFF5e1135),
              primaryContainer: Color(0xFF7a284b),
              onPrimaryContainer: Color(0xFFffd9e5),

              // Secondary
              secondary: Color(0xFFe2bdc7),
              onSecondary: Color(0xFF422931),
              secondaryContainer: Color(0xFF5a4048),
              onSecondaryContainer: Color(0xFFffd9e3),

              // Tertiary
              tertiary: Color(0xFFefbc94),
              onTertiary: Color(0xFF48290c),
              tertiaryContainer: Color(0xFF623f21),
              onTertiaryContainer: Color(0xFFffdcc0),

              // Error
              error: Color(0xFFffb4a9),
              onError: Color(0xFF680003),
              errorContainer: Color(0xFF930006),
              onErrorContainer: Color(0xFFffb4a9),

              // Background
              background: Color(0xFF1f1a1b),
              onBackground: Color(0xFFebdfe1),
              surface: Color(0xFF1f1a1b),
              onSurface: Color(0xFFebdfe1),
              surfaceVariant: Color(0xFF514347),
              onSurfaceVariant: Color(0xFFd5c2c6),

              // Outline
              outline: Color(0xFF9d8c90),
              shadow: Color(0xFF000000),
              inverseSurface: Color(0xFFebdfe1),
              onInverseSurface: Color(0xFF352f30),
              inversePrimary: Color(0xFF984063),
            ),
            fontFamily: 'Google',
            useMaterial3: true,
          ),
          themeMode: currentMode,
          debugShowCheckedModeBanner: false,
          home: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.white,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            child: const HomePage(),
          ),
        );
      },
    );
  }
}
