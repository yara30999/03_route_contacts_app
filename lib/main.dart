import 'package:provider/provider.dart';

import 'resourses/routes_manager.dart';
import 'resourses/theme_manager.dart';
import 'package:flutter/material.dart';

import 'screens/provider/contacts_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContactsProvider>(
      create: (BuildContext context) {
        return ContactsProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'contacts app yara',
        themeMode: ThemeMode.dark,
        darkTheme: getDarkTheme(),
        initialRoute: Routes.splashRoute,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}
