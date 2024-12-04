import 'package:provider/provider.dart';

import 'resourses/routes_manager.dart';
import 'resourses/theme_manager.dart';
import 'package:flutter/material.dart';

import 'screens/provider/contacts_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContactsListProvider>(
      create: (BuildContext context) {
        return ContactsListProvider();
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
