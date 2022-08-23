// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:developer';

import 'package:dynamic_color/dynamic_color.dart';

import "lib.dart";

void main() {
  runApp(
      // DevicePreview(
      // enabled: !kReleaseMode, builder: (context) => const MyApp()));
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DatabaseConfigurationWidget(
      child: DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) => MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: const [Locale("en")],
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: lightDynamic ?? lightColorScheme),
          darkTheme: ThemeData(
              useMaterial3: true, colorScheme: darkDynamic ?? darkColorScheme),
          themeMode: ThemeMode.dark,
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
          // home: const ChipTest()
          // home: const CalendarTest(),
        ),
      ),
    );
  }
}

class DatabaseConfigurationWidget extends StatelessWidget
    with SingleChildStatelessWidgetMixin {
  @override
  final Widget child;
  const DatabaseConfigurationWidget({required this.child, super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return Provider<TrackerProviderModel>(create: (context) {
      log("created database");
      return DatabaseTrackerModel();
    }, builder: (context, _) {
      var model = context.read<TrackerProviderModel>();
      loadDummyData(
          model.trackerProvider, model.pointProvider, model.durationProvider);
      return child!;
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(),
      ),
      body: TrackerListWidget((_) {}),
    );
  }
}

class ToggleTest extends StatefulWidget {
  const ToggleTest({Key? key}) : super(key: key);

  @override
  State<ToggleTest> createState() => _ToggleTestState();
}

class _ToggleTestState extends State<ToggleTest> {
  List<bool> selections = List.generate(2, (index) => false);

  switchSelection(int v) {
    setState(() {
      selections[v] = !selections[v];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: selections,
      onPressed: (i) => switchSelection(i),
      children: const [Text("Hoaa"), Text("Haha")],
    );
  }
}
