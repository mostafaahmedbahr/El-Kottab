import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/register/presentation/view_model/register_cubit.dart';

import '../../../../../main_imports.dart';
import '../../view_model/teachers_cubit.dart';

class TeachersFilterBottomSheet extends StatelessWidget {
  const TeachersFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TeachersCubit>();

    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LangKeys.filterTeachers.tr(),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          Gap(16.h),

          // -------- Slider للتقييم --------
          Text(LangKeys.minimumRate.tr()),
          Slider(
            activeColor: AppColors.darkOlive,
            value: (cubit.selectedRate ?? 0).toDouble(), // Convert int to double for Slider
            min: 0.0,
            max: 5.0,
            divisions: 5,
            label: (cubit.selectedRate ?? 0).toString(),
            onChanged: (value) {
              cubit.selectRating(value);
              print(cubit.selectedRate);
              print("121212");
              (context as Element).markNeedsBuild();
            },
          ),

          Gap(16.h),

          // -------- Dropdown للفئة --------
          Text(LangKeys.category.tr()),
          DropdownButtonFormField<String?>(
            value: cubit.selectedCategory,
            hint: Text(LangKeys.selectCategory.tr()),
            items: [
              const DropdownMenuItem<String?>(
                value: null,
                child: Text('الكل'),
              ),
              ...context.read<RegisterCubit>().categories.map(
                    (e) => DropdownMenuItem<String>(
                  value: e.name.toString(),
                  child: Text(e.name.toString()),
                ),
              ),
            ],
            onChanged: (value) {
              cubit.selectCategory(value);
              (context as Element).markNeedsBuild(); // لتحديث الـ UI
            },
          ),

          Gap(24.h),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    cubit.resetSearchAndFilters();
                    Navigator.pop(context);
                  },
                  child: Text(LangKeys.reset.tr()),
                ),
              ),
              Gap(12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    cubit.applySearchAndFilter(); // هنا نطبق البحث + الفلترة مع بعض
                    Navigator.pop(context);
                  },
                  child: Text(LangKeys.apply.tr()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

