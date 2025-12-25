import 'package:ecommerce_rote/features/home/presentation/view/widgets/item_categories_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_spacing_widget.dart';
import '../../../../../generated/assets.dart';

class CategoriesListViewWidget extends StatelessWidget {
  const CategoriesListViewWidget({super.key,});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return ItemCategoriesListViewWidget(image: Assets.imagesAdvertisement1, title: "hjhggjk", radiusImage: 100.r,heightImage: 100,widthImage: 100,);
      },
      separatorBuilder: (context, index) =>
          CustomWidthSpacingWidget(width: 10),
      itemCount: 2,
    );
  }
}
