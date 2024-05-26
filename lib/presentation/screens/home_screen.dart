import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/config/themes/app_colors.dart';
import 'package:movie_app/config/themes/extensions/app_text_style.dart';
import 'package:movie_app/presentation/cubit/location_cubit.dart';
import 'package:movie_app/presentation/cubit/movies_state.dart';
import 'package:movie_app/presentation/cubit/now_playing_movies_cubit.dart';
import 'package:movie_app/presentation/cubit/top_rated_movies_cubit.dart';
import 'package:movie_app/presentation/widgets/custom_blob.dart';
import 'package:movie_app/presentation/widgets/error_card.dart';
import 'package:movie_app/presentation/widgets/now_playing_section.dart';
import 'package:movie_app/presentation/widgets/top_rated_movie_card.dart';
import 'package:movie_app/presentation/widgets/movie_search_bar.dart';
import 'package:movie_app/presentation/widgets/section_title.dart';
import 'package:movie_app/utils/constants/enums.dart';
import 'package:movie_app/utils/extensions/app_theme_extension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = context.themeData.extension<AppTextStyle>()!;

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFAE94AB),
            AppColors.background,
          ],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<NowPlayingMoviesCubit>().fetchMovies();
            context.read<TopRatedMoviesCubit>().fetchMovies(isRefresh: true);
          },
          child: CustomScrollView(
            controller: context.read<TopRatedMoviesCubit>().scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    // Location Section
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: BlocBuilder<LocationCubit, LocationState>(
                              builder: (context, state) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                          color: AppColors.text,
                                          size: 20,
                                          weight: 1,
                                        ),
                                        Expanded(
                                          child: Text(
                                            state.streetAddress,
                                            style: textStyle.titleSmall
                                                .copyWith(
                                                    color: AppColors.text),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      state.subAddress,
                                      style: textStyle.bodySmall.copyWith(
                                        color: AppColors.textMedium,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                );
                              },
                            ),
                          ),

                          const SizedBox(width: 8),

                          // Avatar
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/images/ww-logo.png',
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Search Bar
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: MovieSearchBar(),
                    ),

                    // Data Blob
                    BlocBuilder<NowPlayingMoviesCubit, MoviesState>(
                      builder: (context, state) {
                        final movieCount =
                            state.status.isLoading ? 0 : state.movies.length;
                        return CustomBlob(
                          date: DateTime.now(),
                          title: 'We Movies',
                          subtitle:
                              '$movieCount Movies are loaded in now playing',
                        );
                      },
                    ),

                    // Now Playing Section
                    const NowPlayingSection(),

                    // Top Rated Section Title
                    const SectionTitle(title: 'Top Rated'),
                  ],
                ),
              ),

              // Top Rated Section
              BlocBuilder<TopRatedMoviesCubit, MoviesState>(
                builder: (context, state) {
                  return SliverPadding(
                    padding: const EdgeInsets.only(bottom: 200),
                    sliver: state.status.isFailure
                        ? SliverToBoxAdapter(
                            child: ErrorCard(
                              errorMessage: 'Something Went Wrong!',
                              onRetry: () {
                                context
                                    .read<TopRatedMoviesCubit>()
                                    .fetchMovies();
                              },
                            ),
                          )
                        : SliverList.builder(
                            itemCount: state.movies.length +
                                (state.status.isLoading ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (state.status.isLoading &&
                                  index == state.movies.length) {
                                return const SizedBox(
                                  height: 200,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                              final movie = state.movies[index];
                              return TopRatedMovieCard(
                                imageUrl: movie.posterPath,
                                views: movie.voteCount,
                                title: movie.title,
                                subtitle: movie.overview,
                                votes: movie.voteCount,
                                rating: movie.voteAverage,
                              );
                            },
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
