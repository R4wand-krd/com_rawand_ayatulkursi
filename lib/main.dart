import 'screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dynamic_color/dynamic_color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new AyatulKursi());
}

class AyatulKursi extends StatelessWidget {
  const AyatulKursi({super.key});

  static final ValueNotifier<ThemeMode> themeSwitch =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: themeSwitch,
          builder: (_, ThemeMode currentMode, __) {
            return MaterialApp(
              themeMode: currentMode,
              theme: ThemeData(
                fontFamily: 'Google',
                useMaterial3: true,
                colorScheme: ColorScheme(
                  brightness: Brightness.light,
                  primary: lightDynamic?.primary ?? const Color(0xFF984063),
                  onPrimary: lightDynamic?.onPrimary ?? const Color(0xFFFFFFFF),
                  primaryContainer:
                      lightDynamic?.primaryContainer ?? const Color(0xFFFFD9E3),
                  onPrimaryContainer: lightDynamic?.onPrimaryContainer ??
                      const Color(0xFF3E001F),
                  secondary: lightDynamic?.secondary ?? const Color(0xFF74565F),
                  onSecondary:
                      lightDynamic?.onSecondary ?? const Color(0xFFFFFFFF),
                  secondaryContainer: lightDynamic?.secondaryContainer ??
                      const Color(0xFFFFD9E3),
                  onSecondaryContainer: lightDynamic?.onSecondaryContainer ??
                      const Color(0xFF2B151D),
                  tertiary: lightDynamic?.tertiary ?? const Color(0xFF7D5635),
                  onTertiary:
                      lightDynamic?.onTertiary ?? const Color(0xFFFFFFFF),
                  tertiaryContainer: lightDynamic?.tertiaryContainer ??
                      const Color(0xFFFFDCC2),
                  onTertiaryContainer: lightDynamic?.onTertiaryContainer ??
                      const Color(0xFF2E1500),
                  error: lightDynamic?.error ?? const Color(0xFFBA1A1A),
                  errorContainer:
                      lightDynamic?.errorContainer ?? const Color(0xFFFFDAD6),
                  onError: lightDynamic?.onError ?? const Color(0xFFFFFFFF),
                  onErrorContainer:
                      lightDynamic?.onErrorContainer ?? const Color(0xFF410002),
                  background:
                      lightDynamic?.background ?? const Color(0xFFFFFBFF),
                  onBackground:
                      lightDynamic?.onBackground ?? const Color(0xFF201A1C),
                  surface: lightDynamic?.surface ?? const Color(0xFFFFFBFF),
                  onSurface: lightDynamic?.onSurface ?? const Color(0xFF201A1C),
                  surfaceVariant:
                      lightDynamic?.surfaceVariant ?? const Color(0xFFF2DDE2),
                  onSurfaceVariant:
                      lightDynamic?.onSurfaceVariant ?? const Color(0xFF514347),
                  outline: lightDynamic?.outline ?? const Color(0xFF837377),
                  onInverseSurface:
                      lightDynamic?.onInverseSurface ?? const Color(0xFFFAEEEF),
                  inverseSurface:
                      lightDynamic?.inverseSurface ?? const Color(0xFF352F30),
                  inversePrimary:
                      lightDynamic?.inversePrimary ?? const Color(0xFFFFB0CA),
                  shadow: lightDynamic?.shadow ?? const Color(0xFF000000),
                  surfaceTint:
                      lightDynamic?.surfaceTint ?? const Color(0xFF984063),
                  outlineVariant:
                      lightDynamic?.outlineVariant ?? const Color(0xFFD5C2C6),
                  scrim: lightDynamic?.scrim ?? const Color(0xFF000000),
                ),
              ),
              darkTheme: ThemeData(
                fontFamily: 'Google',
                useMaterial3: true,
                colorScheme: ColorScheme(
                  brightness: Brightness.dark,
                  primary: darkDynamic?.primary ?? const Color(0xFFFFB0CA),
                  onPrimary: darkDynamic?.onPrimary ?? const Color(0xFF5E1034),
                  primaryContainer:
                      darkDynamic?.primaryContainer ?? const Color(0xFF7B284B),
                  onPrimaryContainer: darkDynamic?.onPrimaryContainer ??
                      const Color(0xFFFFD9E3),
                  secondary: darkDynamic?.secondary ?? const Color(0xFFE2BDC7),
                  onSecondary:
                      darkDynamic?.onSecondary ?? const Color(0xFF422931),
                  secondaryContainer: darkDynamic?.secondaryContainer ??
                      const Color(0xFF5A3F48),
                  onSecondaryContainer: darkDynamic?.onSecondaryContainer ??
                      const Color(0xFFFFD9E3),
                  tertiary: darkDynamic?.tertiary ?? const Color(0xFFEFBC95),
                  onTertiary:
                      darkDynamic?.onTertiary ?? const Color(0xFF48290C),
                  tertiaryContainer:
                      darkDynamic?.tertiaryContainer ?? const Color(0xFF623F20),
                  onTertiaryContainer: darkDynamic?.onTertiaryContainer ??
                      const Color(0xFFFFDCC2),
                  error: darkDynamic?.error ?? const Color(0xFFFFB4AB),
                  errorContainer:
                      darkDynamic?.errorContainer ?? const Color(0xFF93000A),
                  onError: darkDynamic?.onError ?? const Color(0xFF690005),
                  onErrorContainer:
                      darkDynamic?.onErrorContainer ?? const Color(0xFFFFDAD6),
                  background:
                      darkDynamic?.background ?? const Color(0xFF201A1C),
                  onBackground:
                      darkDynamic?.onBackground ?? const Color(0xFFEBE0E1),
                  surface: darkDynamic?.surface ?? const Color(0xFF201A1C),
                  onSurface: darkDynamic?.onSurface ?? const Color(0xFFEBE0E1),
                  surfaceVariant:
                      darkDynamic?.surfaceVariant ?? const Color(0xFF514347),
                  onSurfaceVariant:
                      darkDynamic?.onSurfaceVariant ?? const Color(0xFFD5C2C6),
                  outline: darkDynamic?.outline ?? const Color(0xFF9E8C90),
                  onInverseSurface:
                      darkDynamic?.onInverseSurface ?? const Color(0xFF201A1C),
                  inverseSurface:
                      darkDynamic?.inverseSurface ?? const Color(0xFFEBE0E1),
                  inversePrimary:
                      darkDynamic?.inversePrimary ?? const Color(0xFF984063),
                  shadow: darkDynamic?.shadow ?? const Color(0xFF000000),
                  surfaceTint:
                      darkDynamic?.surfaceTint ?? const Color(0xFFFFB0CA),
                  outlineVariant:
                      darkDynamic?.outlineVariant ?? const Color(0xFF514347),
                  scrim: darkDynamic?.scrim ?? const Color(0xFF000000),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                  statusBarColor: Theme.of(context).colorScheme.background,
                  statusBarBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.dark,
                  systemNavigationBarColor:
                      Theme.of(context).colorScheme.background,
                  systemNavigationBarIconBrightness: Brightness.dark,
                ),
                child: const HomePage(),
              ),
            );
          },
        );
      },
    );
  }
}
