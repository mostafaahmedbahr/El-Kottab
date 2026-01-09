 import 'package:el_kottab/features/teachers/presentation/views/widgets/calls_buttons.dart';
import 'package:el_kottab/main_imports.dart';
import '../../../../../core/shared_widgets/general_fav_icon.dart';
 import '../../../../teachers/presentation/views/widgets/profile_image.dart';

class MainTeacherInfoContainer extends StatelessWidget {
  const MainTeacherInfoContainer({
    super.key,
    required this.name,
    required this.email,
    required this.teacherId,
    required this.isFav, required this.image,
  });

  final String name;
  final String image;
  final String email;
  final int teacherId;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(12.r),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.darkOlive.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GeneralFavIcon(isFav: isFav, teacherId: teacherId),
                      ],
                    ),
                    Gap(8.h),
                    Text(
                      name,
                      style: AppStyles.black16SemiBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SvgPicture.asset(
                        //   SvgImages.star,
                        //   colorFilter: ColorFilter.mode(
                        //     AppColors.warningDark,
                        //     BlendMode.srcIn,
                        //   ),
                        // ),
                        // Gap(4.w),
                        Text(email),
                      ],
                    ),
                    Gap(12.h),
                    CallsButtons(
                        teacherName: name,
                        teacherImage: image,
                        teacherId: teacherId,
                    ),
                  ],
                ),
              ),
            ],
          ),
          ProfileImage(),
        ],
      ),
    );
  }
}
