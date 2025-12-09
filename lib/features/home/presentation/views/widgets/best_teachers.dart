import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/layout/presentation/view_model/layout_cubit.dart';
import 'package:el_kottab/main_imports.dart';
import 'best_teacher_item.dart';

class BestTeachers extends StatelessWidget {
  const BestTeachers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LangKeys.theBestTeachers.tr(),
                style: AppStyles.black16SemiBold.copyWith(
                  fontSize: 18.sp,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<LayoutCubit>().changeBottomNav(1, context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LangKeys.showMore.tr(),
                      style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(4.w),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14.r,
                      color: AppColors.gold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 140.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BestTeacherItem(teacherName: "Mostafa bahr",);
              },
              separatorBuilder: (context, index) {
                return Gap(16.w);
              },
              itemCount: 10,
              padding: EdgeInsets.symmetric(vertical: 8.h),
            ),
          ),
        ],
      ),
    );
  }
}