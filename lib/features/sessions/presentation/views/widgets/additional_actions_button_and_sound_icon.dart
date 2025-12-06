import 'package:easy_localization/easy_localization.dart';

import '../../../../../main_imports.dart';

class AdditionalActionsButtonAndSoundIcon extends StatelessWidget {
  const AdditionalActionsButtonAndSoundIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.volume_up,
              color: Colors.white70,
              size: 18.r,
            ),
            Gap(8.w),
            Container(
              width: 80.w,
              height: 4.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.r),
                color: Colors.white.withValues(alpha: 0.2),
              ),
              child: FractionallySizedBox(
                widthFactor: 0.7,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.r),
                    color: AppColors.darkOlive,
                  ),
                ),
              ),
            ),
          ],
        ),


        CustomButton(
          width: 100.w,
          height: 30.h,
          onPressed: () {},
          child: Text(
            LangKeys.showMore.tr(),
            style: AppStyles.white12SemiBold,
          ),
        ),
      ],
    );
  }
}
