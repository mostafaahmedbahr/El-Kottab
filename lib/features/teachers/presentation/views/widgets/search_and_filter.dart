import 'package:el_kottab/main_imports.dart';

import '../../../../../core/shared_widgets/container_search_widget.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: ContainerSearchWidget()),
        Gap(12.w),
        InkWell(
          borderRadius: BorderRadius.circular(8.r),
          onTap: (){},
          child: Container(
            padding: EdgeInsets.all(6.r),
            height:54.h,
            width: 54.w ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.darkOlive.withValues(alpha: 0.2),
            ),
            child: SvgPicture.asset(SvgImages.filter,colorFilter: ColorFilter.mode(AppColors.darkOlive, BlendMode.srcIn),),
          ),
        ),
      ],
    );
  }
}
