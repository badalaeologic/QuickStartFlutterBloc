import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:quick_start_flutter_bloc/app_entry.dart';
import 'package:quick_start_flutter_bloc/networking/dio_injector.dart';
import 'package:quick_start_flutter_bloc/networking/repository/repository.dart';
import 'package:quick_start_flutter_bloc/networking/repository/repository_provider.dart';
import 'package:quick_start_flutter_bloc/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 300,
      colors: true,
      printEmojis: true,
      printTime: false // Should each log print contain a timestamp
      ),
);

void main() async {
  Logger.level = Level.verbose;
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final dio = DioInjector();
  dio.init(prefs);
  GetIt getIt = GetIt.instance;
  getIt.allowReassignment = true;
  getIt.registerSingleton<Repository>(
    RepositoryProvider(prefs: prefs, dio: dio.dio),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Start',
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Roboto',
              )),
      home: AppEntry(),
    );
  }
}
