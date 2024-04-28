import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema_app/core/common/model/bloc_status_state.dart';
import 'package:cinema_app/features/account/presentation/account_route.dart';
import 'package:cinema_app/features/home/data/models/movie.dart';
import 'package:cinema_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:cinema_app/features/home/presentation/bloc/home_event.dart';
import 'package:cinema_app/features/home/presentation/bloc/home_state.dart';
import 'package:cinema_app/features/movie_detail/presentation/movie_detail_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/common/widget/customize_button.dart';
import '../../../../core/common/constants/assets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int carouselActiveIndex = 0;

  late ThemeData theme;

  List<Movie> movies = [];

  HomeBloc get bloc => BlocProvider.of<HomeBloc>(context);

  void initState() {
    super.initState();
    bloc.add(GetUpcomingMovieHomeEvent());
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.status == BlocStatusState.failed) {
            showOkAlertDialog(context: context, message: state.errorMessage);
          }
        },
        builder: (context, state) {
          movies = state.upcomingMovies ?? [];
          return SafeArea(
            bottom: false,
            child: Container(
              color: theme.colorScheme.background,
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                children: [
                  _buildAppbar(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Builder(
                            builder: (context) {
                              if (state.status == BlocStatusState.failed ||
                                  state.upcomingMovies == null) {
                                return const SizedBox(
                                  height: 290,
                                  child: NotFoundDataWidget(),
                                );
                              }
                              return _buildUpcomingCarousel();
                            },
                          ),
                          _buildNowInCinema(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAppbar() {
    return Container(
      color: theme.colorScheme.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(Assets.svg.icLogo),
          _buildAppBarInfoItem(assets: Assets.svg.icLocation, label: 'TP.HCM'),
          _buildAppBarInfoItem(assets: Assets.svg.icLanguage, label: 'Eng'),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CustomizedButton(
              onTap: () {
                Navigator.pushNamed(context, AccountRoute.routeName);
              },
              text: 'Profile',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarInfoItem({required String assets, required String label}) {
    return Row(
      children: [
        SvgPicture.asset(assets),
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _buildUpcomingCarousel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Text(
            'Upcoming',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        CarouselSlider(
          items:
              movies.map((e) => _buildCarouselItem(e.posterUrl ?? '')).toList(),
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                carouselActiveIndex = index;
              });
            },
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.4,
            aspectRatio: 16 / 9,
            viewportFraction: 0.55,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        AnimatedSmoothIndicator(
          activeIndex: carouselActiveIndex,
          count: movies.length,
          effect: ExpandingDotsEffect(
            dotWidth: 8,
            dotHeight: 8,
            activeDotColor: theme.colorScheme.primary,
            dotColor: theme.colorScheme.primaryContainer,
          ),
        ),
      ],
    );
  }

  Container _buildCarouselItem(String url) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.network(url),
    );
  }

  Widget _buildNowInCinema() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Now in Cinemas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.search,
                size: 36,
                color: theme.colorScheme.primaryContainer,
              ),
            ],
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // width height ratio
            childAspectRatio: 163 / 278,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: movies.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailRoute.routeName,
                  arguments: [movies[index].id],
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      movies[index].posterUrl ?? '',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    movies[index].title ?? '--',
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(
                    movies[index].genre ?? '--',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.colorScheme.primaryContainer),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class NotFoundDataWidget extends StatelessWidget {
  const NotFoundDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.svg.icEmptyPopcorn,
        ),
        const SizedBox(
          height: 16,
        ),
        const Text('Not found data'),
      ],
    );
  }
}
