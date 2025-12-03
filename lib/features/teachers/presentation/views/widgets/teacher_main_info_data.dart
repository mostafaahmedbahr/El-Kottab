import 'package:el_kottab/features/teachers/presentation/views/widgets/profile_image.dart';
import 'package:el_kottab/main_imports.dart';

class TeacherMainInfoData extends StatelessWidget {
  const TeacherMainInfoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileImage(),
        Gap(12.w),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Mostafa Bahr" * 10,
                      style: AppStyles.black16SemiBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.grayLightest,
                          ),
                          child: SvgPicture.asset(
                            SvgImages.notify,
                            colorFilter: ColorFilter.mode(
                              AppColors.gold,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      Gap(12.w),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 20.h,
                          width: 20.w,
                          padding: EdgeInsets.all(4.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.grayLightest,
                          ),
                          child: SvgPicture.asset(
                            SvgImages.fav,
                            colorFilter: ColorFilter.mode(
                              AppColors.gold,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Gap(8.h),
              Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        SvgImages.star,
                        colorFilter: ColorFilter.mode(
                          AppColors.warningDark,
                          BlendMode.srcIn,
                        ),
                      ),
                      Gap(4.w),
                      Text("4.6"),
                    ],
                  ),
                  Gap(8.w),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.gold
                    ),
                    child: Text("Arabic",style: AppStyles.white12SemiBold,),
                  ),
                  Gap(8.w),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 8.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.gold
                    ),
                    child: Text("Arabic",style: AppStyles.white12SemiBold,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
