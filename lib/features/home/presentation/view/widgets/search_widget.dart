import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/app_texts.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            hintStyle: AppTextStyles.blackW300S14Poppins,
            cursorColor: AppColors.primaryColor,
            keyboardType: TextInputType.text,
            enabledBorderColor: AppColors.primaryColor,
            radiusEnabled: 25,
            radiusFocus: 25,
            prefixIcon: Icons.search,
            hintText: AppTexts.whatDoYouSearchFor,
            controller: TextEditingController(),
          ),
        ),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.shopping_cart_outlined,size: 24.sp,color: AppColors.primaryColor,),
          tooltip: AppTexts.cart,
        ),
      ],
    );
  }
}
