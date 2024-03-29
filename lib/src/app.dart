import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:honest_calorie/src/day_view/day_appbar.dart';
import 'package:honest_calorie/src/statistics_view/statistics_view.dart';
import 'settings/settings_controller.dart';
import 'package:honest_calorie/src/day_view/day_view.dart';
import 'package:honest_calorie/src/products_view/products_view.dart';
import 'settings/settings_view.dart';

class App extends StatefulWidget {
  const App({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: widget.settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: widget.settingsController.themeMode,

          home: Scaffold(
            appBar: AppBar(
              title: [
                AppBar(
                  title: const Text('Statistics'),
                ),
                DayAppBar(selectedDay: DateTime.now()),
                AppBar(
                  title: const Text('Products'),
                ),
                AppBar(
                  title: const Text('Settings'),
                ),
              ][currentPageIndex],
            ),
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              destinations: const <Widget>[
                NavigationDestination(
                  selectedIcon: Icon(Icons.line_axis),
                  icon: Icon(Icons.line_axis_outlined),
                  label: 'Statistics',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.list),
                  icon: Icon(Icons.list_outlined),
                  label: 'Products',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.settings),
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings',
                ),
              ],
              selectedIndex: currentPageIndex,
            ),
            body: <Widget>[
              const StatisticsView(),
              const DayView(),
              const ProductsView(),
              SettingsView(controller: widget.settingsController)
            ][currentPageIndex],
          ),
        );
      },
    );
  }
}
