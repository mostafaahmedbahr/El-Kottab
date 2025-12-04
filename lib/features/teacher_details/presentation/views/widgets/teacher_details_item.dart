import 'package:el_kottab/main_imports.dart';

class TeacherDetailsItem extends StatelessWidget {
  const TeacherDetailsItem({super.key, required this.svgImage, required this.title, required this.des});
  final String svgImage;
  final String title;
  final String des;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkOlive.withValues(alpha: 0.1) ,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color:AppColors.darkOlive.withValues(alpha: 0.2)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(svgImage,height: 20.h,width: 20.w,fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(AppColors.darkOlive, BlendMode.srcIn),),
              Gap(6.w),
              Text("$title : ",style: AppStyles.black16SemiBold,),
            ],
          ),
          Gap(8.h),
          Text(des,style: AppStyles.black12SemiBold,),
        ],
      ),
    );
  }
}
