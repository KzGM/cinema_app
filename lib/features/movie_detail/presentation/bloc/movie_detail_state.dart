// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/common/model/bloc_status_state.dart';
import '../../domain/entities/movie_detail_entity.dart';
import '../../domain/entities/movie_session_entity.dart';

class MovieDetailState {
  BlocStatusState status;
  MovieDetailEntity? movieDetail;
  List<MovieSessionEntity>? movieSessions;
  String? successMessage; // Toast, snackbar
  String? errorMessage; // Dialog
  MovieDetailState({
    required this.status,
    this.movieDetail,
    this.movieSessions,
    this.successMessage,
    this.errorMessage,
  });

  MovieDetailState copyWith({
    required BlocStatusState status,
    MovieDetailEntity? movieDetail,
    List<MovieSessionEntity>? movieSessions,
    String? successMessage,
    String? errorMessage,
  }) {
    return MovieDetailState(
      status: status, // alway replace new value
      movieDetail: movieDetail ?? this.movieDetail, // cache
      movieSessions: movieSessions ?? this.movieSessions, // cache
      successMessage: successMessage, // do not pass <=> null
      errorMessage: errorMessage, // do not pass <=> null
    );
  }
}
