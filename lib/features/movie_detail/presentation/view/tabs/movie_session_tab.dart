import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../ticket/domain/entities/ticket_entity.dart';
import '../../../../ticket/presentation/ticket_route.dart';
import '../../../domain/entities/movie_session_entity.dart';
import '../../bloc/movie_detail_bloc.dart';
import '../../bloc/movie_detail_event.dart';
import '../../bloc/movie_detail_state.dart';
import '../widgets/by_cinema_session_item.dart';
import '../widgets/calendar_session_item.dart';
import '../widgets/sort_session_item.dart';
import '../../../../../core/utils/double_utils.dart';

class MovieSessionTab extends StatefulWidget {
  String movieId;
  MovieSessionTab({super.key, required this.movieId});

  @override
  State<MovieSessionTab> createState() => _NewMovieSessionTabState();
}

class _NewMovieSessionTabState extends State<MovieSessionTab> {
  late ThemeData _theme;

  TextTheme get _textTheme => _theme.textTheme;

  ColorScheme get _colorScheme => _theme.colorScheme;

  MovieDetailBloc get bloc => BlocProvider.of(context);

  List<MovieSessionEntity> sessions = [];

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
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        sessions = state.movieSessions ?? [];
        return Column(
          children: [
            SizedBox(
              height: 75,
              child: Row(
                children: [
                  Expanded(
                    child: CalendarSessionItem(
                      // Delegate, Observer
                      onDateChanged: onDateCallBack,
                    ),
                  ),
                  const Expanded(
                    child: SortSessionItem(),
                  ),
                  const Expanded(
                    child: ByCinemaSessionItem(),
                  ),
                ],
              ),
            ),
            Container(
              color: _colorScheme.surface,
              height: 30,
              child: Row(
                children: [
                  Container(
                    width: 16 +
                        60 +
                        32.5, // left padding + text + divider(32 + 0.5)
                    alignment: Alignment.center,
                    child: Text(
                      'Time',
                      style: _textTheme.labelMedium
                          ?.copyWith(color: _colorScheme.primaryContainer),
                    ),
                  ),
                  Expanded(child: _buildTicketPriceRow(isHeader: true)),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      final movieDetail = state.movieDetail;
                      final selectedSession = sessions[index];
                      final entity = TicketEntity(
                        title: movieDetail?.title,
                        runTime: movieDetail?.runtime,
                        filmFormat: selectedSession.filmFormat,
                        theater: selectedSession.theater,
                        time: selectedSession.sessionTime,
                        seats: ['F4', 'F5'],
                        unitPrice: selectedSession.adultPrice,
                      );
                      Navigator.pushNamed(
                        context,
                        TicketRoute.routeName,
                        arguments: entity,
                      );
                    },
                    child: Container(
                      color: _colorScheme.background,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 60,
                            child: Column(
                              children: [
                                Text(
                                  sessions[index].sessionTime == null
                                      ? '--'
                                      : formatDate(
                                          sessions[index].sessionTime!,
                                          [HH, ':', nn],
                                        ),
                                  style: _textTheme.titleMedium,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    sessions[index].filmFormat ?? '--',
                                    style: _textTheme.bodySmall?.copyWith(
                                      color: _colorScheme.primaryContainer,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 0.5,
                            height: 40,
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            color: _colorScheme.primaryContainer,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sessions[index].theater ?? '--',
                                  style: _textTheme.labelLarge,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                _buildTicketPriceRow(session: sessions[index]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: _colorScheme.outline,
                  );
                },
                itemCount: sessions.length,
              ),
            ),
          ],
        );
      },
    );
  }

  void onDateCallBack(DateTime dateTime) {
    bloc.add(
      GetMovieSessionsEvent(
        movieId: widget.movieId,
        sessionDate: dateTime,
      ),
    );
  }

  Row _buildTicketPriceRow({
    bool isHeader = false,
    MovieSessionEntity? session,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        _ticketPrice(
          isHeader: isHeader,
          value:
              isHeader ? 'Adult' : (session?.adultPrice?.toVnd() ?? '100.000đ'),
        ),
        const SizedBox(
          width: 16,
        ),
        _ticketPrice(
          isHeader: isHeader,
          value: isHeader
              ? 'Children'
              : (session?.childPrice?.toVnd() ?? '100.000đ'),
        ),
        const SizedBox(
          width: 16,
        ),
        _ticketPrice(
          isHeader: isHeader,
          value: isHeader
              ? 'Student'
              : (session?.studentPrice?.toVnd() ?? '100.000đ'),
        ),
        const SizedBox(
          width: 16,
        ),
        _ticketPrice(
          isHeader: isHeader,
          value: isHeader ? 'VIP' : (session?.vipPrice?.toVnd() ?? '100.000đ'),
        ),
      ],
    );
  }

  Expanded _ticketPrice({bool isHeader = false, required String value}) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          value,
          style: isHeader
              ? _textTheme.labelMedium
                  ?.copyWith(color: _colorScheme.primaryContainer)
              : null,
        ), // 14 -> font<14 || font> 14
      ),
    );
  }
}
