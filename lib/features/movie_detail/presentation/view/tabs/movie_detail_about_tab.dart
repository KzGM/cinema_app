import 'package:cinema_app/core/common/constants/assets.dart';
import 'package:cinema_app/core/common/widget/customize_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
  late YoutubePlayerController _ytbController;
  @override
  void initState() {
    super.initState();
    if (widget.movieDetailEntity?.youtubeUrl != null) {
      _youtubeInit();
    }
  }

  @override
  void dispose() {
    _ytbController.dispose();
    super.dispose();
  }

  void _youtubeInit() {
    final initVideoID =
        YoutubePlayer.convertUrlToId(widget.movieDetailEntity!.youtubeUrl!);
    _ytbController = YoutubePlayerController(
        initialVideoId: initVideoID ?? "",
        flags: const YoutubePlayerFlags(autoPlay: false, mute: false));
  }

  @override
  void didUpdateWidget(covariant AboutTabWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.movieDetailEntity?.youtubeUrl !=
        oldWidget.movieDetailEntity?.youtubeUrl) {
      _ytbController.dispose();
    }
    if (widget.movieDetailEntity?.youtubeUrl != null) {
      _youtubeInit();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final width = MediaQuery.of(context).size.width;
    theme = Theme.of(context);
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
                                  child: SvgPicture.asset(
                                      Assets.images.icYTBLogo)),
                            ),
                          ],
                          progressIndicatorColor: Colors.red,
                          progressColors: const ProgressBarColors(
                            backgroundColor: Colors.grey,
                            playedColor: Colors.red,
                            bufferedColor: Colors.grey,
                            handleColor: Colors.grey,
                          ),
                          controller: _ytbController,
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
          child: CustomizedButton(
            onTap: () {},
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
