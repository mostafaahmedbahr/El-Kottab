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

          Text(LangKeys.minimumRate.tr()),
          Slider(
            activeColor: AppColors.darkOlive,
            value: (cubit.selectedRate ?? 0).toDouble(),
            min: 0.0,
            max: 5.0,
            divisions: 5,
            label: (cubit.selectedRate ?? 0).toString(),
            onChanged: (value) {
              cubit.selectRating(value);
              (context as Element).markNeedsBuild();
            },
          ),

          Gap(16.h),

          Text(LangKeys.category.tr()),
          DropdownButtonFormField<String?>(
            initialValue: cubit.selectedCategory,
            hint: Text(LangKeys.selectCategory.tr()),
            items: [
                DropdownMenuItem<String?>(
                value: null,
                child: Text(LangKeys.all.tr()),
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
              (context as Element).markNeedsBuild();
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
                    cubit.applySearchAndFilter();
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

