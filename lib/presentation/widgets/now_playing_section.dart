import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/themes/extensions/app_text_style.dart';
import 'package:movie_app/presentation/cubit/movies_state.dart';
import 'package:movie_app/presentation/cubit/now_playing_movies_cubit.dart';
import 'package:movie_app/presentation/widgets/error_card.dart';
import 'package:movie_app/presentation/widgets/now_playing_movie_card.dart';
import 'package:movie_app/presentation/widgets/section_title.dart';
import 'package:movie_app/utils/constants/enums.dart';
import 'package:movie_app/utils/extensions/app_theme_extension.dart';

class NowPlayingSection extends StatefulWidget {
  const NowPlayingSection({super.key});

  @override
  State<NowPlayingSection> createState() => _NowPlayingSectionState();
}

class _NowPlayingSectionState extends State<NowPlayingSection> {
  late final textStyle = context.themeData.extension<AppTextStyle>()!;
  late final pageController =
      context.read<NowPlayingMoviesCubit>().pageController;

  int currentIndex = 0;
  int totalItems = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Now Playing Section Title
    return Column(
      children: [
        const SectionTitle(title: 'Now Playing'),
        SizedBox(
          height: 420,
          child: BlocBuilder<NowPlayingMoviesCubit, MoviesState>(
            builder: (context, state) {
              if (state.status.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.status.isFailure) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ErrorCard(
                      errorMessage: 'Something Went Wrong!',
                      onRetry: () {
                        context.read<NowPlayingMoviesCubit>().fetchMovies();
                      },
                    ),
                  ],
                );
              }
              totalItems = state.movies.length;
              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      padEnds: false,
                      controller: pageController,
                      itemCount: totalItems,
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];

                        return Padding(
                          padding: EdgeInsets.only(
                            top: 5,
                            left: index == 0 ? 20 : 10,
                            right: index == totalItems - 1 ? 20 : 10,
                          ),
                          child: NowPlayingMovieCard(
                            imageUrl: movie.posterPath,
                            views: movie.voteCount,
                            title: movie.title,
                            subtitle: movie.overview,
                            votes: movie.voteCount,
                            rating: movie.voteAverage,
                          ),
                        );
                      },
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                    ),
                  ),

                  // Page Indicator
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${currentIndex + 1}/$totalItems',
                      style:
                          textStyle.labelMedium.copyWith(color: Colors.white),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
