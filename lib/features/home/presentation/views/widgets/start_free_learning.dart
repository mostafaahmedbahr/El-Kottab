import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/main_imports.dart';

class StartFreeLearning extends StatelessWidget {
  const StartFreeLearning({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.white,
          border: Border.all(
            color: AppColors.cream,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Row(
             children: [
               SvgPicture.asset(SvgImages.teacher,height: 50.h,colorFilter: ColorFilter.mode(AppColors.gold,
                   BlendMode.srcIn
               ),),
               Gap(12.w),
               SizedBox(
                 width: 200.w,
                 child: Text(LangKeys.startLearningAlFatihahWithUsForFree.tr(),style: AppStyles.black16SemiBold,
                   maxLines: 2,overflow: TextOverflow.ellipsis,
                 ),
               ),
             ],
           ),
            Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.darkOlive
              ),
              child: Icon(Icons.arrow_forward,color: AppColors.white,),
            ),

          ],
        ),
      ),
    );
  }
}
