import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/main_imports.dart';

class AboutTheTeacher extends StatelessWidget {
  const AboutTheTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Simple Description"),
        IconButton(
          onPressed: () {},
          icon: Row(
            children: [
              Text(LangKeys.aboutTeacher.tr()),
              Gap(4.w),
              Icon(Icons.arrow_forward_ios, size: 14.sp),
            ],
          ),
        ),
      ],
    );
  }
}
