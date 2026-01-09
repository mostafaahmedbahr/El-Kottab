import 'package:el_kottab/features/teachers/presentation/views/widgets/teachers_filter_bottom_sheet.dart';
import 'package:el_kottab/main_imports.dart';

import '../../../../../core/shared_widgets/container_search_widget.dart';
import '../../view_model/teachers_cubit.dart';
import '../../view_model/teachers_states.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<TeachersCubit , TeachersStates>(
       builder: (context,state){
         var teachersCubit = context.read<TeachersCubit>();
         return Row(
           children: [
             Expanded(
               child: ContainerSearchWidget(
                 controller: teachersCubit.searchController,
                 onChanged: (value) {
                   teachersCubit.searchByName(value);
                 },
               ),
             ),
             Gap(12.w),
             InkWell(
               borderRadius: BorderRadius.circular(8.r),
               onTap: () {
                 showModalBottomSheet(
                   context: context,
                   isScrollControlled: true,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                   ),
                   builder: (_) => const TeachersFilterBottomSheet(),
                 );
               },
               child: Container(
                 padding: EdgeInsets.all(6.r),
                 height: 54.h,
                 width: 54.w,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8.r),
                   color: AppColors.darkOlive.withValues(alpha: 0.2),
                 ),
                 child: SvgPicture.asset(
                   SvgImages.filter,
                   colorFilter: ColorFilter.mode(
                     AppColors.darkOlive,
                     BlendMode.srcIn,
                   ),
                 ),
               ),
             ),
           ],
         );
       },

     );
  }
}

