import 'package:ecommerce_rote/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_spacing_widget.dart';

class ItemCategoriesListViewWidget extends StatelessWidget {
  const ItemCategoriesListViewWidget({super.key, required this.image, required this.title,  this.radiusImage, this.widget, this.widthImage, this.heightImage});
  final String image;
  final String title;
  final double? radiusImage;
  final double? widthImage;
  final double? heightImage;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(radiusImage??0),
              child: Image.asset(image,fit: BoxFit.fill,width: widthImage,height: heightImage,)
          ),
          CustomHeightSpacingWidget(height: 8),
          Text(title,style: AppTextStyles.primaryW400S14Poppins,),
        ],
      ),
  widget??SizedBox.shrink()
  ]
    );
  }
}
