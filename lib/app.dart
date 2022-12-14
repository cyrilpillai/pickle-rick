import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'characters/presentation/screens/list_screen.dart';

class PickleRickApp extends StatelessWidget {
  const PickleRickApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pickle Rick',
      theme: ThemeData(primarySwatch: Colors.green),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ListScreen(),
    );
  }
}
