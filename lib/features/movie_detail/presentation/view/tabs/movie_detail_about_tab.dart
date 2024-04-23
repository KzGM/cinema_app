import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/common/widget/customize_button.dart';
import '../../../../../core/utils/date_utils.dart';
import '../../../../../core/utils/double_utils.dart';
import '../../../../../core/utils/int_utils.dart';
import '../../../../../core/utils/localizations.dart';
import '../../../../../core/utils/string_utils.dart';
import '../../../../movie_detail/domain/entities/movie_detail_entity.dart';

class AboutTabWidget extends StatefulWidget {
  final MovieDetailEntity? movieDetailEntity;
  const AboutTabWidget({
    Key? key,
    this.movieDetailEntity,
  }) : super(key: key);

  @override
  State<AboutTabWidget> createState() => _AboutTabWidgetState();
}

class _AboutTabWidgetState extends State<AboutTabWidget>
    with AutomaticKeepAliveClientMixin {
  late ThemeData theme;

  TextTheme get _textTheme => theme.textTheme;
  ColorScheme get _colorScheme => theme.colorScheme;
  late YoutubePlayerController youtubeController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Call init state');
  }

  @override
  void didUpdateWidget(covariant AboutTabWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('Call Did update widget');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final width = MediaQuery.of(context).size.width;
    theme = Theme.of(context);
    youtubeController = YoutubePlayerController(
      // initialVideoId: widget.movieDetailEntity?.youtubeUrl ?? '',
      initialVideoId: 'XeDbyVODQ5M',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        loop: true,
        mute: false,
        hideControls: false,
        controlsVisibleAtStart: true,
        showLiveFullscreenButton: false,
      ),
    );
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: width,
                  height: width * 9 / 16,
                  // child: YoutubePlayer(
                  //   controller: youtubeController,
                  // ),
                  child: widget.movieDetailEntity?.youtubeUrl?.isNotEmpty ==
                          true
                      ? YoutubePlayer(
                          showVideoProgressIndicator: true,
                          topActions: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  print('Mở app youtube');
                                },
                                child: Text(
                                  widget.movieDetailEntity?.youtubeName ?? '',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                          bottomActions: [
                            GestureDetector(
                              onTap: () {
                                print('Mở app youtube');
                              },
                              child: SizedBox(
                                width: 48,
                                height: 48,
                                child: Image.network(
                                  'https://www.iconpacks.net/icons/2/free-youtube-logo-icon-2431-thumb.png',
                                ),
                              ),
                            ),
                          ],
                          progressIndicatorColor: Colors.red,
                          progressColors: const ProgressBarColors(
                            backgroundColor: Colors.grey,
                            playedColor: Colors.red,
                            bufferedColor: Colors.grey,
                            handleColor: Colors.grey,
                          ),
                          controller: youtubeController,
                        )
                      : const SizedBox(),
                ),
                Container(
                  color: _colorScheme.surface,
                  child: Row(
                    children: [
                      _buildRatingItem(
                        widget.movieDetailEntity?.voteAverage
                            ?.toStringAsFixed(1),
                        'IMDB',
                      ),
                      Container(
                        width: 1,
                        height: 70,
                        color: _colorScheme.outline,
                      ),
                      _buildRatingItem(
                        widget.movieDetailEntity?.voteCount?.addCommas(),
                        translate(context).vote,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        widget.movieDetailEntity?.description ?? '',
                        style: _textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _buildMovieInfoRow(
                        'Runtime',
                        widget.movieDetailEntity?.runtime
                            ?.toStringAsFixed(0)
                            .addUnitPost(translate(context).minutes),
                      ),
                      _buildMovieInfoRow(
                        'Release',
                        widget.movieDetailEntity?.releaseDate
                                ?.toLocalddmmyyyy() ??
                            '',
                      ),
                      _buildMovieInfoRow(
                        'Genre',
                        widget.movieDetailEntity?.genre,
                      ),
                      _buildMovieInfoRow(
                        'Budget',
                        (widget.movieDetailEntity?.budget ?? 0) == 0
                            ? null
                            : widget.movieDetailEntity?.budget?.toDollar(),
                      ),
                      _buildMovieInfoRow(
                        'Prod Countries',
                        widget.movieDetailEntity?.countries?.join(', '),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: _colorScheme.surface.withOpacity(0.7),
          padding: const EdgeInsets.all(16),
          child: CustomizeButton(
            onPress: () {},
            text: translate(context).selectSessions,
            backgroundColor: _colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildMovieInfoRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(
              title,
              style: _textTheme.bodyMedium
                  ?.copyWith(color: _colorScheme.primaryContainer),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Text(
              value ?? translate(context).unknown,
              style: _textTheme.bodyMedium
                  ?.copyWith(color: _colorScheme.onBackground),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildRatingItem(String? value, String? unit) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              value ?? '',
              style: _textTheme.titleLarge,
            ),
            Text(
              unit ?? '',
              style: _textTheme.bodyMedium
                  ?.copyWith(color: _colorScheme.primaryContainer),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
