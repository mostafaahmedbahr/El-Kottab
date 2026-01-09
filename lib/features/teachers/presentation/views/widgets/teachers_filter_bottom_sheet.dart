import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/register/presentation/view_model/register_cubit.dart';
import '../../../../../main_imports.dart';
import '../../view_model/teachers_cubit.dart';
import '../../view_model/teachers_states.dart';

class TeachersFilterBottomSheet extends StatelessWidget {
  const TeachersFilterBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TeachersCubit>();
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 16.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Title
          Text(
            LangKeys.filterTeachers.tr(),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          Gap(16.h),

          /// Rate Filter
          Text(LangKeys.minimumRate.tr()),
          Gap(8.h),
          BlocBuilder<TeachersCubit, TeachersStates>(
            builder: (context, state) {
              return Slider(
                activeColor: AppColors.darkOlive,
                value: cubit.selectedRate ?? 0,
                min: 0,
                max: 5,
                divisions: 5,
                label: '${cubit.selectedRate ?? 0}',
                onChanged: (value) {
                 cubit.selectRatingFun(value);
                },
              );
            },
          ),

          Gap(16.h),

          /// Category Filter
          Text(LangKeys.category.tr()),
          Gap(8.h),
          DropdownButtonFormField<int>(
            value: cubit.selectedCategoryId,
            hint:   Text(LangKeys.selectCategory.tr()),
            items:context.read<RegisterCubit>().categories.map((category) {
              return DropdownMenuItem<int>(
                value: category.id,
                child: Text(category.name.toString()),
              );
            }).toList(),
            onChanged: (value) {
              cubit.selectedCategoryId = value;
            },
          ),

          Gap(24.h),

          /// Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    cubit.resetFilters();
                  },
                  child:   Text(LangKeys.reset.tr()),
                ),
              ),
              Gap(12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    cubit.applyFilters();
                    Navigator.pop(context);
                  },
                  child:   Text(LangKeys.apply.tr()),
                ),
              ),
            ],
          ),

          Gap(24.h),
        ],
      ),
    );
  }
}
