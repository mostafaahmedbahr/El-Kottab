import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/teacher_details/presentation/views/all_teacher_reviews_view.dart';
import 'package:el_kottab/main_imports.dart';

import 'comment_item.dart';

class TeacherReviews extends StatelessWidget {
  const TeacherReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkOlive.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.darkOlive.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    SvgImages.comment,
                    height: 20.h,
                    width: 20.w,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      AppColors.darkOlive,
                      BlendMode.srcIn,
                    ),
                  ),
                  Gap(6.w),
                  Text(
                    "${LangKeys.comments.tr()} : ",
                    style: AppStyles.black16SemiBold,
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  AppNav.customNavigator(context: context, screen: AllTeacherReviewsView());
                },
                child: Text(
                  LangKeys.viewAll.tr(),
                  style: AppStyles.black16Medium,
                ),
              ),
            ],
          ),
          Gap(8.h),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CommentItem(
                userName: "userName",
                userImage:
                    "https://pluspng.com/img-png/user-png-icon-young-user-icon-2400.png",
                commentText: "commentText",
                rating: 4.5,
              );
            },
            separatorBuilder: (context, index) {
              return Gap(8.h);
            },
            itemCount: 2,
          ),
        ],
      ),
    );
  }
}
