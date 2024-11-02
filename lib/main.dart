import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/repository/weather_repository.dart';

import 'cache_config/cache_config.dart';
import 'feature/feature.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.web);

  runApp(
      DevicePreview(
        backgroundColor: Colors.white,
        //enabled: !kReleaseMode, // use web
        //enabled: !kDebugMode,  // use emulator
        availableLocales: const [Locale('en','US')],
        // Start with Galaxy A50 as it's a common Android device
        defaultDevice: Devices.android.samsungGalaxyS20,

        // Show toolbar to let users test different devices
        isToolbarVisible: !kReleaseMode,
        // Customize preview controls
        tools: const [
          // Device selection controls
          DeviceSection(
            model: true, // Option to change device model to fit your needs
            orientation: false, // Lock to portrait for consistent demo
            frameVisibility: false, // Hide frame options
            virtualKeyboard: false, // Hide keyboard
          ),

          // Theme switching section
          // SystemSection(
          //   locale: false, // Hide language options - we're keeping it English only
          //   theme: false, // Show theme switcher if your app has dark/light modes
          // ),

          // Disable accessibility for demo simplicity
          // AccessibilitySection(
          //   boldText: false,
          //   invertColors: false,
          //   textScalingFactor: false,
          //   accessibleNavigation: false,
          // ),

          // Hide extra settings to keep demo focused
          // SettingsSection(
          //   backgroundTheme: false,
          //   toolsTheme: false,
          // ),
        ],

        // Curated list of devices for comprehensive preview
        devices: [
          // ... Devices.all, // uncomment to see all devices

          // Popular Android Devices
          Devices.android.samsungGalaxyA50, // Mid-range
          Devices.android.samsungGalaxyNote20, // Large screen
          Devices.android.samsungGalaxyS20, // Flagship
          Devices.android.samsungGalaxyNote20Ultra, // Premium
          Devices.android.onePlus8Pro, // Different aspect ratio
          Devices.android.sonyXperia1II, // Tall screen

          // Popular iOS Devices
          //Devices.ios.iPhoneSE, // Small screen
          //Devices.ios.iPhone12, // Standard size
          Devices.ios.iPhone12Mini, // Compact
          Devices.ios.iPhone12ProMax, // Large
          Devices.ios.iPhone13, // Latest standard
          Devices.ios.iPhone13ProMax, // Latest large
          Devices.ios.iPhone13Mini, // Latest compact
          //Devices.ios.iPhoneSE, // Budget option
        ],
        builder: (context) => const MyApp(),
      )
      //const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final dynamic _weatherApi = WeatherApi();
  final _cacheConfig = CacheConfig();

  late final _weatherRepository = WeatherRepository(remoteApi: _weatherApi, cacheConfig: _cacheConfig);


  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: MaterialApp(
        title: 'Beautiful Weather App',
        debugShowCheckedModeBanner: false,
        // device preview
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AppScreen(),
        //home: const SavedLocationsScreen(),
      ),
    );
  }
}


