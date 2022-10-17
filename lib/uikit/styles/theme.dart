import 'package:flutter/material.dart';

import 'text_theme.dart';

ThemeData materialTheme() => ThemeData(
      useMaterial3: true,
      textTheme: textTheme.apply(
        fontFamily: 'Montserrat',
      ),
      fontFamily: 'Montserrat',
    );
