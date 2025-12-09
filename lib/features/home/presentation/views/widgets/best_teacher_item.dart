import 'package:el_kottab/core/utils/app_nav.dart';
import 'package:el_kottab/features/teacher_details/presentation/views/teacher_details_view.dart';
import 'package:el_kottab/main_imports.dart';

class BestTeacherItem extends StatelessWidget {
  const BestTeacherItem({super.key, required this.teacherName});
  final String teacherName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppNav.customNavigator(context: context, screen: TeacherDetailsView(teacherName: teacherName));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        width: 220.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.darkOlive.withValues(alpha: .1),
          border: Border.all(
            color: AppColors.darkOlive,
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 6.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.darkOlive,
                  width: 2.w,
                ),
              ),
              child: ClipOval(
                child: CustomNetWorkImage(
                  raduis: 50,
                  imageUrl: "https://ichef.bbci.co.uk/ace/standard/976/cpsprodpb/153FD/production/_126973078_whatsubject.jpg.webp",
                  width: 60.w,
                  height: 60.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "mostafa bahr",
                    style: AppStyles.black16SemiBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(4.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        SvgImages.star,
                        width: 16.w,
                        height: 16.h,
                        colorFilter: ColorFilter.mode(
                          AppColors.warningDark,
                          BlendMode.srcIn,
                        ),
                      ),
                      Gap(4.w),
                      Text(
                        "4.6",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Gap(8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.darkOlive,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            SvgImages.phone,
                            width: 18.w,
                            height: 18.h,
                            colorFilter: ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          padding: EdgeInsets.all(8.r),
                        ),
                      ),
                      Gap(4.w),
                      Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.darkOlive,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            SvgImages.video,
                            width: 18.w,
                            height: 18.h,
                            colorFilter: ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          padding: EdgeInsets.all(8.r),
                        ),
                      ),
                      Gap(4.w),
                      Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.darkOlive,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            SvgImages.chat,
                            width: 18.w,
                            height: 18.h,
                            colorFilter: ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          padding: EdgeInsets.all(8.r),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}