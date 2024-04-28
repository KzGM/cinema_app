import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/constants/assets.dart';
import '../../../../core/common/model/bloc_status_state.dart';
import '../../../../core/utils/localizations.dart';
import '../../../movie_detail/presentation/bloc/movie_detail_event.dart';
import '../bloc/movie_detail_bloc.dart';
import '../bloc/movie_detail_state.dart';
import 'tabs/movie_detail_about_tab.dart';
import 'tabs/movie_session_tab.dart';

class MovieDetailScreen extends StatefulWidget {
  String movieId;
  MovieDetailScreen({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late ThemeData theme;

  TextTheme get _textTheme => theme.textTheme;
  ColorScheme get _colorScheme => theme.colorScheme;
  // late YoutubePlayerController youtubeController;

  MovieDetailBloc get bloc => BlocProvider.of(context);

  @override
  void initState() {
    super.initState();
    bloc.add(GetMovieDetailEvent(movieId: widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return BlocListener<MovieDetailBloc, MovieDetailState>(
      listener: (context, state) {
        if (state.status == BlocStatusState.loading) {
          EasyLoading.show();
        } else {
          EasyLoading.dismiss();
        }

        if (state.status == BlocStatusState.failed) {
          showOkAlertDialog(
            context: context,
            message: state.errorMessage,
            title: translate(context).error,
          );
        } else if (state.status == BlocStatusState.success) {}
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: BlocBuilder<MovieDetailBloc, MovieDetailState>(
              builder: (context, state) {
                return Text(
                  state.movieDetail?.title ?? translate(context).movieDetail,
                  style: _textTheme.titleMedium,
                );
              },
            ),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: _colorScheme.outline,
              dividerHeight: 2,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(translate(context).about),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(translate(context).sessions),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BlocBuilder<MovieDetailBloc, MovieDetailState>(
                builder: (context, state) {
                  final movie = state.movieDetail;
                  if (movie == null) {
                    return Center(
                      child: SvgPicture.asset(Assets.svg.icEmptyPopcorn),
                    );
                  }
                  return AboutTabWidget(
                    movieDetailEntity: movie,
                  );
                },
              ),
              MovieSessionTab(
                movieId: widget.movieId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
