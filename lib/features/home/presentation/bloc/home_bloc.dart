import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/model/bloc_status_state.dart';
import '../../../../main.dart';
import '../../data/remote/home_rest_api.dart';
import '../../domain/repository/home_repository.implement.dart';
import '../../domain/usecases/home_usecases.dart';
import '../../domain/usecases/home_usecases.implement.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(status: BlocStatusState.initial)) {
    on<GetUpcomingMovieHomeEvent>(_onGetUpcomingMovieHomeEvent);
  }

  final HomeUsecases _usecase = HomeUsecasesImplement(
    HomeRepositoryImplement(HomeRestApi(dioClient.dio)),
  );

  FutureOr<void> _onGetUpcomingMovieHomeEvent(
    GetUpcomingMovieHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatusState.loading));
    try {
      final movies = await _usecase.getUpcomingMovies();
      if (movies != null) {
        emit(
          state.copyWith(
            status: BlocStatusState.success,
            upcomingMovies: movies,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: BlocStatusState.failed,
            errorMessage: 'Đã xảy ra lỗi',
          ),
        );
      }
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
