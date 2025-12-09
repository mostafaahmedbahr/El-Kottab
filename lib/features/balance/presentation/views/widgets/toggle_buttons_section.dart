import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class  ToggleButtonsSection extends StatelessWidget {
  const  ToggleButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.history_toggle_off,color: AppColors.white,size: 24.sp,),
                Text(LangKeys.history.tr(),style: AppStyles.white16SemiBold,),
              ],
            ),
              onPressed: (){
          
              },),
        ),
        Gap(12.w),
        Expanded(
          child: CustomButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.all_inclusive,color: AppColors.white,size: 24.sp,),
                Text(LangKeys.packages.tr(),style: AppStyles.white16SemiBold,),
              ],
            ),
            onPressed: (){

            },),
        ),
      ],
    );
  }
}
