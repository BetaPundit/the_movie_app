import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/injection/injection.dart';
import 'package:movie_app/config/themes/app_colors.dart';
import 'package:movie_app/config/themes/extensions/app_text_style.dart';
import 'package:movie_app/presentation/cubit/now_playing_movies_cubit.dart';
import 'package:movie_app/presentation/cubit/top_rated_movies_cubit.dart';
import 'package:movie_app/presentation/screens/home_screen.dart';
import 'package:movie_app/utils/extensions/app_theme_extension.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  late final textStyle = context.themeData.extension<AppTextStyle>()!;

  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    MultiBlocProvider(
      providers: [
        BlocProvider<TopRatedMoviesCubit>(
          create: (context) => locator<TopRatedMoviesCubit>()..fetchMovies(),
        ),
        BlocProvider<NowPlayingMoviesCubit>(
          create: (context) => locator<NowPlayingMoviesCubit>()..fetchMovies(),
        ),
      ],
      child: const HomeScreen(),
    ),
    const Center(child: Text('Explore Page')),
    const Center(child: Text('Upcoming Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      extendBody: true,
      // Bottom Nav Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        selectedLabelStyle: textStyle.bodySmall,
        unselectedLabelStyle: textStyle.bodySmall,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.black,
              child: Text(
                'we',
                style: textStyle.labelSmall.copyWith(
                  color: Colors.white,
                  height: 1.3,
                ),
              ),
            ),
            label: 'We Movies',
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.map),
            label: 'Explore',
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar),
            label: 'Upcoming',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
