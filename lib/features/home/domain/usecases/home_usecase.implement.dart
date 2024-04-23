import '../../data/models/movie.dart';
import '../repository/home_repository.dart';
import '../repository/home_repository.implement.dart';
import 'home_usecase.dart';

class NewHomeUsecasesImplement extends HomeUsecases {
  final HomeRepository repo;

  NewHomeUsecasesImplement(this.repo);
  @override
  Future<List<Movie>?> getUpcomingMovies() {
    return repo.getUpcomingMovies();
  }
}
