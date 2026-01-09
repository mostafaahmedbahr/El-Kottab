import 'package:el_kottab/core/shared_widgets/general_fav_icon.dart';
import 'package:el_kottab/features/teachers/presentation/views/widgets/profile_image.dart';
import 'package:el_kottab/main_imports.dart';

class TeacherMainInfoData extends StatelessWidget {
  const TeacherMainInfoData({super.key, required this.name, required this.rate,required this.languages, required this.image, required this.isFav, required this.teacherId});
  final String name;
  final String image;
  final int rate;
  final int teacherId;
  final bool isFav;
  final   List<String> languages;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileImage(image: image,),
        Gap(12.w),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                     name,
                      style: AppStyles.black16SemiBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      // InkWell(
                      //   onTap: () {},
                      //   child: Container(
                      //     height: 20.h,
                      //     width: 20.w,
                      //     decoration: BoxDecoration(
                      //       shape: BoxShape.circle,
                      //       color: AppColors.grayLightest,
                      //     ),
                      //     child: SvgPicture.asset(
                      //       SvgImages.notify,
                      //       colorFilter: ColorFilter.mode(
                      //         AppColors.gold,
                      //         BlendMode.srcIn,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Gap(12.w),
                      GeneralFavIcon(isFav: isFav, teacherId: teacherId),
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
                      Text("$rate"),
                    ],
                  ),
                  Gap(8.w),
                  if (languages.isNotEmpty)
                    ...languages.map((language) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.gold,
                          ),
                          child: Text(
                            language,
                            style: AppStyles.white12SemiBold,
                          ),
                        ),
                      );
                    }),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
