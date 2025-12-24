import 'package:el_kottab/features/free_learning/presentation/view_model/free_learning_cubit.dart';
import 'package:el_kottab/features/free_learning/presentation/view_model/free_learning_states.dart';
import '../../../../../main_imports.dart';

class RandomTeacherInfo extends StatelessWidget {
  const RandomTeacherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FreeLearningCubit, FreeLearningStates>(
      builder: (context, state) {
        var freeLearningCubit = context.read<FreeLearningCubit>();

        // تحقق من null قبل الاستخدام
        final teacher = freeLearningCubit.randomTeacherModel?.data;
        final hasTeacher = teacher != null;
        final hasImage = teacher?.image != null && teacher!.image!.isNotEmpty;

        return Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: AppColors.cream,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teacher?.name ?? "لا يوجد مدرس متاح",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (teacher?.email != null) ...[
                      Gap(4.h),
                      Text(
                        teacher!.email!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.gray,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),

              // الصورة مع التحقق من null
              if (hasTeacher && hasImage)
                CustomNetWorkImage(
                  height: 50.h,
                  width: 50.w,
                  imageUrl: teacher.image!,
                  raduis: 50.r,
                )
              else
                _buildDefaultAvatar(),
            ],
          ),
        );
      },
    );
  }

  // Widget بديل عندما لا توجد صورة
  Widget _buildDefaultAvatar() {
    return Container(
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(
        color: AppColors.darkOlive.withValues(alpha: 0.1),
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.darkOlive.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.person,
          size: 24.sp,
          color: AppColors.darkOlive,
        ),
      ),
    );
  }
}