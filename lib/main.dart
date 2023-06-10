import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'package:catbreeds_bloc/data/services/cat_api_dio_service.dart';
import 'package:catbreeds_bloc/data/utils/domain/environment.dart';

import 'package:catbreeds_bloc/domain/blocs/app/app_bloc.dart';
import 'package:catbreeds_bloc/domain/blocs/breeds/breeds_bloc.dart';
import 'package:catbreeds_bloc/domain/blocs/detail/detail_bloc.dart';

import 'package:catbreeds_bloc/device/language/app_localizations_enum.dart';
import 'package:catbreeds_bloc/device/language/app_localizations_delegate.dart';

import 'package:catbreeds_bloc/ui/router/app_router.dart';
import 'package:catbreeds_bloc/ui/themes/app_theme.dart';



Future<void> main() async {

  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();

  final languageCode = PlatformDispatcher.instance.locale.languageCode;
  await const AppLocalizationsDelegate().load(Locale(languageCode));

  CatApiDioService().configureDio();
  CatApiDioService().configureApiKey(Environment.theCatApiKey);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBloc()),
        BlocProvider(create: (context) => BreedsBloc()),
        BlocProvider(create: (context) => DetailBloc()),
      ],
      child: const MyApp(),
    )
  );
}


class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: [
            Locale(AppLocaleEnum.english.code),
            Locale(AppLocaleEnum.spanish.code)
          ],
          routerConfig: appRouter,
          theme: AppTheme(isDarkMode: state.isDarkMode).getTheme(),
        );
      }
    );
  }
}