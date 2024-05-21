import 'package:ecommerce_app/core/Theme/theme.dart';
import 'package:ecommerce_app/core/database/cachehelper.dart';
import 'package:ecommerce_app/core/injection/injectionservice.dart';
import 'package:ecommerce_app/core/networking/firebase_notification.dart';
import 'package:ecommerce_app/core/routes/router.dart';
import 'package:ecommerce_app/features/Settings/settingscubit/settingsbloc.dart';
import 'package:ecommerce_app/features/Settings/settingscubit/settingsstate.dart';
import 'package:ecommerce_app/features/functions.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setUpDependencyInjection();
makeLandOrPort();
  await CacheHelper().intializeSharedPref();
  Bloc.observer=  MyBlocObserver();
   firebaseOptions();
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override

  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => SettingsCubit(),
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) => MaterialApp.router(

              locale: Locale(BlocProvider.of<SettingsCubit>(context).currentlang),
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: 'My Stylish App',
              theme: BlocProvider.of<SettingsCubit>(context).switchstate ? darkmode : lightmode,
              routerConfig: gorouter,
              debugShowCheckedModeBanner: false,
            ),
          ),
        );
      },
    );
  }
}
class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}
