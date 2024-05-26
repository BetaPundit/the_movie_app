import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/injection/injection.dart';
import 'package:movie_app/config/themes/app_theme.dart';
import 'package:movie_app/presentation/cubit/location_cubit.dart';
import 'package:movie_app/presentation/screens/splash_screen.dart';
import 'package:movie_app/utils/constants/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Make Status Bar transparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocProvider(
        create: (context) => locator<LocationCubit>(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Constants.appTitle,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
