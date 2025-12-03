import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/main_imports.dart';

class CallsButtons extends StatelessWidget {
  const CallsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Expanded(
           child: CustomButton(
             height: 40.h,
             onPressed: (){},
             child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               SvgPicture.asset(SvgImages.phone,colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),),
               Text(LangKeys.voiceCall.tr(),style: AppStyles.white12SemiBold,),

             ],
           ),


           ),
         ),
        Gap(12.w),
        Expanded(
          child: CustomButton(
            height: 40.h,
            onPressed: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(SvgImages.video,height: 20.h,colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),),
                Text(LangKeys.videoCall.tr(),style: AppStyles.white12SemiBold,),

              ],
            ),


          ),
        ),
      ],
    );
  }
}
