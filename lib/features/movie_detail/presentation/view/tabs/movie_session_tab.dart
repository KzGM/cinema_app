import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/movie_detail_bloc.dart';
import '../../bloc/movie_detail_event.dart';

class MovieSessionTab extends StatefulWidget {
  String movieId;
  MovieSessionTab({super.key, required this.movieId});

  @override
  State<MovieSessionTab> createState() => _MovieSessionTabState();
}

class _MovieSessionTabState extends State<MovieSessionTab> {
  // Mock Session Array: 10 phần tử. 0 -> 9
  late ThemeData _theme;

  TextTheme get _textTheme => _theme.textTheme;

  ColorScheme get _colorScheme => _theme.colorScheme;

  MovieDetailBloc get bloc => BlocProvider.of(context);

  @override
  void initState() {
    super.initState();
    bloc.add(
      GetMovieSessionsEvent(
        movieId: widget.movieId,
        sessionDate: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Column(
      children: [
        Container(
          height: 75,
          color: Colors.red,
        ),
        Container(
          height: 30,
          color: Colors.green,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return SizedBox(
                height: 78,
                child: Center(
                  child: Text(
                    index.toString(),
                    style: _textTheme.bodyLarge,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: _colorScheme.outline,
              );
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
