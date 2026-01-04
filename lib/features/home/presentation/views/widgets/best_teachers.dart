import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/home/presentation/view_model/home_cubit.dart';
import 'package:el_kottab/features/home/presentation/view_model/home_states.dart';
import 'package:el_kottab/features/layout/presentation/view_model/layout_cubit.dart';
import 'package:el_kottab/main_imports.dart';
import 'best_teacher_item.dart';
import 'best_teachers_loading.dart';

class BestTeachers extends StatelessWidget {
  const BestTeachers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, current) {
        return current is GetBestTeachersSuccessState ||
            current is GetBestTeachersErrorState ||
            current is GetBestTeachersLoadingState;
      },
      builder: (context, state) {
        var homeCubit = context.read<HomeCubit>();
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
                    style: AppStyles.black16SemiBold.copyWith(fontSize: 18.sp),
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
                child:
                    state is GetBestTeachersLoadingState ||
                        homeCubit.bestTeachersModel == null
                    ? BestTeachersLoading()
                    : homeCubit.bestTeachersModel != null &&
                          homeCubit.bestTeachersModel!.data!.isEmpty
                    ? Center(
                      child: Text(
                          LangKeys.noTeachersFound.tr(),
                          style: AppStyles.black16SemiBold,
                        ),
                    )
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var teacher =
                              homeCubit.bestTeachersModel!.data![index];
                          return BestTeacherItem(
                            teacherName: teacher.name.toString(),
                            teacherImage: teacher.image.toString(),
                            teacherRate: teacher.rate.toString(),
                            teacherId: teacher.id!,
                            teacherNumber: "01110690299",
                            userId: CacheHelper.getData(key: "userId"),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Gap(16.w);
                        },
                        itemCount: homeCubit.bestTeachersModel!.data!.length,
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
