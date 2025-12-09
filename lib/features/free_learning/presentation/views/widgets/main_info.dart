import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/core/utils/app_images/jpg_images.dart';

import '../../../../../main_imports.dart';

class MainInfo extends StatelessWidget {
  const MainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.white,
        border: Border.all(
          color: AppColors.cream
        )
      ),
      child: Column(
        children: [
          Image.asset(JpgImages.teacher,height: 150.h,),
          Gap(12.h),
          Text(LangKeys.aLFatihahInitiative.tr(),style: AppStyles.black24SemiBold,),
          Gap(12.h),
          Text(LangKeys.thisInvitationHelpUsers.tr(),style: AppStyles.gray16SemiBold,),
          Gap(12.h),

        ],
      ),
    );
  }
}
