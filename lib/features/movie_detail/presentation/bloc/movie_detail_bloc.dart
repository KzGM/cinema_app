import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/model/bloc_status_state.dart';
import '../../../../main.dart';
import '../../data/datasource/remote/movie_detail_rest_api.dart';
import '../../domain/repo/movie_detail_repository.implement.dart';
import '../../domain/usecases/movie_detail_usecases.dart';
import '../../domain/usecases/movie_detail_usecases.implement.dart';
import 'movie_detail_event.dart';
import 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailState(status: BlocStatusState.initial)) {
    on<GetMovieDetailEvent>(_onGetMovieDetailEvent);
    on<GetMovieSessionsEvent>(_onGetMovieSessionsEvent);
  }

  final MovieDetailUsecases _usecase = MovieDetailUsecasesImplement();

  FutureOr<void> _onGetMovieDetailEvent(
    GetMovieDetailEvent event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatusState.loading));
    try {
      final movieDetail =
          await _usecase.getMovieDetail(event.movieId); // 3s response
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          movieDetail: movieDetail,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatusState.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onGetMovieSessionsEvent(
    GetMovieSessionsEvent event,
    Emitter<MovieDetailState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatusState.loading));
    try {
      final movieSession = await _usecase.getMovieSessions(
        movieId: event.movieId,
        sessionDate: event.sessionDate,
      ); // 3s response
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          movieSessions: movieSession,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatusState.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
