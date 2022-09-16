import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData buildLightTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: Colors.white,
      unselectedWidgetColor: const Color(0xFF263238).withOpacity(0.5),
      disabledColor: const Color(0xFFA6A6A6),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle:
            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          final Color color = states.contains(MaterialState.error)
              ? lightThemeColorsScheme().error
              : const Color(0xFF000000).withOpacity(0.6);
          return TextStyle(
            color: color,
            fontFamily: "Roboto",
          );
        }),
        hintStyle: TextStyle(
          fontFamily: "Roboto",
          color: const Color(0xFF000000).withOpacity(0.6),
          fontSize: 16.0,
        ),
        errorStyle: TextStyle(
          fontFamily: "Roboto",
          color: lightThemeColorsScheme().error,
          fontSize: 14.0,
        ),
        suffixStyle: TextStyle(
            fontFamily: "Roboto",
            color: const Color(0xFF000000).withOpacity(0.6),
            fontSize: 16.0),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
        labelStyle: TextStyle(
          fontFamily: "Roboto",
          fontSize: 16.0,
          color: const Color(0xFF000000).withOpacity(0.6),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: lightThemeColorsScheme().outline),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: lightThemeColorsScheme().outline),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: lightThemeColorsScheme().outline),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      ),
      colorScheme: lightThemeColorsScheme(),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.black),

      //Theme for appbar
      appBarTheme: AppBarTheme(
        backgroundColor: lightThemeColorsScheme().primary,
        shadowColor: lightThemeColorsScheme().shadow,
        titleTextStyle: TextStyle(
            color: lightThemeColorsScheme().onPrimary,
            fontSize: 20.0,
            fontWeight: FontWeight.w600),
        iconTheme: IconThemeData(
          color: lightThemeColorsScheme().onPrimary,
          size: 25,
        ),
      ),

      //Theme for all text data
      textTheme: TextTheme(
        bodyText1: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
            fontSize: 13.0,
            color: const Color(0xFF151522).withOpacity(0.8)),
        bodyText2: const TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w300,
            fontSize: 13.0,
            height: 1.2,
            color: Color(0xFF151522)),
        button: const TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            fontSize: 11,
            color: Color(0xFF151522)),
        caption: const TextStyle(
          color: Color(0xFF151522),
          fontSize: 12.0,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
        subtitle2: const TextStyle(
          color: Color(0xFF5F6368),
          fontSize: 13.0,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
        subtitle1: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter"),
        headlineLarge: TextStyle(
          fontFamily: "Roboto",
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF000000).withOpacity(0.6),
        ),
        headline1: const TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily: "Inter"),
        headline2: TextStyle(
          fontFamily: "Roboto",
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF000000).withOpacity(0.8),
        ),
        headline3: const TextStyle(
            height: 1.2,
            fontSize: 14.0,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            color: Color(0xFF1A1A1A)),
        headline4: const TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w600,
            fontSize: 15.0,
            color: Color(0xFF000000)),
        headline5: TextStyle(
            fontFamily: "Roboto",
            fontSize: 13,
            color: const Color(0xFF000000).withOpacity(0.8)),
        headline6: const TextStyle(
            fontFamily: "Roboto", fontSize: 14, color: Color(0xFF000000)),
      ),

      //Theme for data table
      dataTableTheme: DataTableThemeData(
        columnSpacing: 20.0,
        horizontalMargin: 10.0,
        headingRowHeight: 40.0,
        checkboxHorizontalMargin: 10.0,
        headingRowColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          // All rows will have the same selected color.
          return Colors.grey.withOpacity(0.1);
        }),
        dataRowColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          // All rows will have the same selected color.
          if (states.contains(MaterialState.selected)) {
            return Colors.blue.withOpacity(0.08);
          }
          return const Color(
              0xFFFFFFFF); // Use default value for other states and odd rows.
        }),
      ),

      //CheckBox Theme data
      checkboxTheme: CheckboxThemeData(
        fillColor:
            MaterialStateProperty.all(const Color(0xFF000000).withOpacity(0.3)),
      ),
    );
  }

  ColorScheme lightThemeColorsScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFBE0E1D),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFFFDAD5),
      onPrimaryContainer: Color(0xFF410003),
      secondary: Color(0xFFB12D1E),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFFFDAD2),
      onSecondaryContainer: Color(0xFF410000),
      tertiary: Color(0xFFA7383A),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFFFDAD6),
      onTertiaryContainer: Color(0xFF410005),
      error: Color(0xFFB3261E),
      errorContainer: Color(0xFFF9DEDC),
      onError: Color(0xFFFFFFFF),
      onErrorContainer: Color(0xFF410E0B),
      background: Color(0xFFFFFBFE),
      onBackground: Color(0xFF1C1B1F),
      surface: Color(0xFFFFFBFE),
      onSurface: Color(0xFF1C1B1F),
      surfaceVariant: Color(0xFFE7E0EC),
      onSurfaceVariant: Color(0xFF49454F),
      outline: Color(0xFF79747E),
      onInverseSurface: Color(0xFFF4EFF4),
      inverseSurface: Color(0xFF313033),
      inversePrimary: Color(0xFFFFB3AA),
      shadow: Color(0xFF000000),
    );
  }

  ThemeData buildDarkTheme() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFF121212),
      unselectedWidgetColor: const Color(0xFFffffff).withOpacity(0.5),
      disabledColor: const Color(0xFF2A2A2A),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.white),
      //colorScheme for app
      colorScheme: darkThemeColorScheme(), //theme for appbar
      appBarTheme: AppBarTheme(
        backgroundColor: darkThemeColorScheme().primary,
        shadowColor: darkThemeColorScheme().shadow,
        titleTextStyle: TextStyle(
            color: darkThemeColorScheme().onPrimary,
            fontSize: 20.0,
            fontWeight: FontWeight.w600),
        iconTheme: IconThemeData(
          color: darkThemeColorScheme().onPrimary,
          size: 25,
        ),
      ),

      //This is text theme data
      textTheme: TextTheme(
        bodyText1: const TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
            fontSize: 13.0,
            color: Color(0xFFD7D8DA)),
        bodyText2: const TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w300,
            fontSize: 13.0,
            height: 1.2,
            color: Color(0xFFD7D8DA)),
        button: const TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            fontSize: 11,
            color: Color(0xFFD7D8DA)),
        caption: const TextStyle(
          color: Color(0xFFD7D8DA),
          fontSize: 12.0,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
        subtitle1: const TextStyle(
            color: Color(0xFFD7D8DA),
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter"),
        subtitle2: const TextStyle(
          color: Color.fromARGB(255, 247, 247, 247),
          fontSize: 13.0,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: const TextStyle(
          fontFamily: "Roboto",
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: Color(0xFFD7D8DA),
        ),
        headline1: const TextStyle(
            color: Color(0xFFD7D8DA),
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily: "Inter"),
        headline2: const TextStyle(
          fontFamily: "Roboto",
          fontSize: 16.0,
          color: Color(0xFFD7D8DA),
        ),
        headline3: const TextStyle(
            height: 1.2,
            fontSize: 14.0,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            color: Color(0xFFD7D8DA)),
        headline4: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w600,
            fontSize: 15.0,
            color: const Color(0xFFFFFFFF).withOpacity(0.6)),
        headline5: const TextStyle(
            fontFamily: "Roboto", fontSize: 13, color: Color(0xFFD7D8DA)),
        headline6: const TextStyle(
            fontFamily: "Roboto", fontSize: 14, color: Color(0xFFD7D8DA)),
      ),

      //Theme for text Form Field
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(
          fontFamily: "Roboto",
          color: const Color(0xFFFFFFFF).withOpacity(0.6),
        ),
        hintStyle: TextStyle(
          fontFamily: "Roboto",
          color: const Color(0xFFFFFFFF).withOpacity(0.6),
          fontSize: 16.0,
        ),
        suffixStyle: TextStyle(
            fontFamily: "Roboto",
            color: const Color(0xFFFFFFFF).withOpacity(0.6),
            fontSize: 16.0),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
        labelStyle: const TextStyle(fontSize: 16.0, color: Color(0xFFD7D8DA)),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xFFFFFFFF).withOpacity(0.5)),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xFFFFFFFF).withOpacity(0.5)),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xFFFFFFFF).withOpacity(0.5)),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      ),

      //Theme for data table
      dataTableTheme: DataTableThemeData(
        columnSpacing: 20.0,
        horizontalMargin: 10.0,
        headingRowHeight: 40.0,
        checkboxHorizontalMargin: 10.0,
        headingRowColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          // All rows will have the same selected color.

          return Colors.grey.withOpacity(0.1);
        }),
        dataRowColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          // All rows will have the same selected color.
          if (states.contains(MaterialState.selected)) {
            return Colors.blue.withOpacity(0.08);
          }

          return const Color(
              0xFF121212); // Use default value for other states and odd rows.
        }),
      ),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(
              const Color(0xFFFFFFFF).withOpacity(0.3)),
          checkColor: MaterialStateProperty.all(const Color(0xFFFFFFFF))),
    );
  }

  ColorScheme darkThemeColorScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFFFB3AA),
      onPrimary: Color(0xFF680007),
      primaryContainer: Color(0xFF93000E),
      onPrimaryContainer: Color(0xFFFFDAD5),
      secondary: Color(0xFFFFB4A6),
      onSecondary: Color(0xFF680000),
      secondaryContainer: Color(0xFF8E1208),
      onSecondaryContainer: Color(0xFFFFDAD2),
      tertiary: Color(0xFFFFB3B0),
      onTertiary: Color(0xFF660511),
      tertiaryContainer: Color(0xFF862125),
      onTertiaryContainer: Color(0xFFFFDAD6),
      error: Color(0xFFF2B8B5),
      errorContainer: Color(0xFF8C1D18),
      onError: Color(0xFF601410),
      onErrorContainer: Color(0xFFF9DEDC),
      background: Color(0xFF1C1B1F),
      onBackground: Color(0xFFE6E1E5),
      surface: Color(0xFF1C1B1F),
      onSurface: Color(0xFFE6E1E5),
      surfaceVariant: Color(0xFF49454F),
      onSurfaceVariant: Color(0xFFCAC4D0),
      outline: Color(0xFF938F99),
      onInverseSurface: Color(0xFF1C1B1F),
      inverseSurface: Color(0xFFE6E1E5),
      inversePrimary: Color(0xFFBE0E1D),
      shadow: Color(0xFF000000),
    );
  }
}
