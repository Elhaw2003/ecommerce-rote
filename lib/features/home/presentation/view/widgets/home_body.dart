import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_rote/core/utils/app_text_styles.dart';
import 'package:ecommerce_rote/core/utils/app_texts.dart';
import 'package:ecommerce_rote/core/widgets/custom_spacing_widget.dart';
import 'package:ecommerce_rote/features/home/presentation/view/widgets/carousel_slider_and_smooth_indicator_widget.dart';
import 'package:ecommerce_rote/features/home/presentation/view/widgets/carousel_slider_widget.dart';
import 'package:ecommerce_rote/features/home/presentation/view/widgets/categories_list_view_widget.dart';
import 'package:ecommerce_rote/features/home/presentation/view/widgets/search_widget.dart';
import 'package:ecommerce_rote/features/home/presentation/view/widgets/smooth_indicator_widget.dart';
import 'package:ecommerce_rote/features/home/presentation/view/widgets/view_all_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.h, right: 18.h, left: 18.h),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SearchWidget()),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 16)),
          SliverToBoxAdapter(child: CarouselSliderAndSmoothIndicatorWidget()),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 24)),
          SliverToBoxAdapter(
            child: ViewAllRowWidget(title: AppTexts.categories),
          ),
          SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 16)),
          SliverToBoxAdapter(
            child: SizedBox(height: 150.h, child: CategoriesListViewWidget()),
          ),
        ],
      ),
    );
  }
}
