import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema_app/features/home/data/models/movie.dart';
import 'package:flutter/material.dart';
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
  List<Movie> movies = [];

  int carouselActiveIndex = 0;

  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
          child: Container(
        color: theme.colorScheme.background,
        padding: const EdgeInsets.only(bottom: 8),
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [_buildUpcommingCarousel(), _buildNowInCinema()],
              ),
            ))
          ],
        ),
      )),
    );
  }

  Widget _buildAppBar() {
    return Container(
      color: theme.colorScheme.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(Assets.svg.icLogo),
          _buildAppBarInfoItem(assets: Assets.svg.icLocation, label: 'TP.HCM'),
          _buildAppBarInfoItem(assets: Assets.svg.icLanguage, label: 'Eng'),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CustomizeButton(
              onPress: () {},
              text: 'Profile',
            ),
          )
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

  Widget _buildUpcommingCarousel() {
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
            items: movies
                .map((e) => _buildCarouselItem(e.posterUrl ?? ''))
                .toList(),
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
                enlargeStrategy: CenterPageEnlargeStrategy.zoom)),
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
              dotColor: theme.colorScheme.primaryContainer),
        )
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
              )
            ],
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 163 / 278,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: movies.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Expanded(
                    child: Image.network(
                  movies[index].posterUrl ?? '',
                  fit: BoxFit.fill,
                )),
                Text(
                  movies[index].title ?? '--',
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  movies[index].genre ?? '--',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.colorScheme.primaryContainer),
                )
              ],
            );
          },
        )
      ],
    );
  }
}
