import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/core/global/resources/constants_manager.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/views/movie_details_view/widgets/movie_detail_app_bar.dart';

import '../../controller/movie_details_bloc/movie_details_bloc.dart';
import 'similar_movies/more_like_this_text.dart';
import 'widgets/movie_detail_duration.dart';
import 'widgets/movie_detail_date_release.dart';
import 'widgets/movie_detail_over_view.dart';
import 'widgets/movie_detail_rating.dart';
import 'widgets/movie_detail_title.dart';
import 'widgets/movie_details_genres.dart';
import 'similar_movies/similar_movies_section.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestState.loading:
            return Center(
              child: CircularProgressIndicator(color: AppColors.white),
            );

          case RequestState.loaded:
            final movie = state.movieDetails;
            return CustomScrollView(
              key: const Key(AppString.movieDetailScrollViewKey),
              slivers: [
                MovieDetailsAppBar(movie: movie),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: FadeInUp(
                      from: AppConstants.fromFadeInUp,
                      duration: const Duration(
                        milliseconds: AppDuration.d500,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MovieDetailsTitle(movie: movie),
                          const SizedBox(height: AppSize.s8),
                          Row(
                            children: [
                              MovieDetailsDateRelease(movie: movie),
                              const SizedBox(width: AppSize.s16),
                              MovieDetailsRating(movie: movie),
                              const SizedBox(width: AppSize.s16),
                              MovieDetailsDuration(movie: movie),
                            ],
                          ),
                          const SizedBox(height: AppSize.s20),
                          MovieDetailsOverView(movie: movie),
                          const SizedBox(height: AppSize.s16),
                          MovieDetailsGenres(movie: movie),
                        ],
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: MoreLikeThisText(),
                ),
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(
                    AppSize.s16,
                    AppSize.s0,
                    AppSize.s16,
                    AppSize.s24,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: SimilarMoviesSection(),
                  ),
                ),
              ],
            );

          case RequestState.error:
            return Center(
              child: Text(state.movieDetailsMessage),
            );
        }
      },
    );
  }
}