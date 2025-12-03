import 'dart:math';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/main_imports.dart';
import 'package:el_kottab/features/teachers/presentation/view_model/teachers_cubit.dart';
import 'package:el_kottab/features/teachers/presentation/view_model/teachers_states.dart';

class AllTeachersAndFavToggleButtons extends StatelessWidget {
  const AllTeachersAndFavToggleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersCubit, TeachersStates>(
      builder: (context, state) {
        final teachersCubit = context.read<TeachersCubit>();
        return AnimatedToggleSwitch<int>.size(
          current: teachersCubit.buttonValue,
          height: 54.h,
          style: ToggleStyle(
            backgroundColor: AppColors.grayLighter,
            indicatorColor: AppColors.lightGold,
            borderColor: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0.r),
            indicatorBorderRadius: BorderRadius.zero,
          ),
          values: const [0, 1],
          iconOpacity: 1.0,
          selectedIconScale: 1.0,
          indicatorSize: Size.fromWidth(200.w),
          iconAnimationType: AnimationType.onHover,
          styleAnimationType: AnimationType.onHover,
          spacing: 2.0,
          customSeparatorBuilder: (context, local, global) {
            final opacity = ((global.position - local.position).abs() - 0.5)
                .clamp(0.0, 1.0);
            return VerticalDivider(
              indent: 10.0,
              endIndent: 10.0,
              color: Colors.white38.withValues(alpha: opacity),
            );
          },
          customIconBuilder: (context, local, global) {
            final text = [
              LangKeys.allTeachers.tr(),
              LangKeys.favoriteTeachers.tr(),
            ][local.index];
            return Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color.lerp(
                    Colors.black,
                    Colors.white,
                    local.animationValue,
                  ),
                ),
              ),
            );
          },
          borderWidth: 0.0,
          onChanged: (i) {
            teachersCubit.updateButtonValue(i);
          },
        );
      },
    );
  }
}
