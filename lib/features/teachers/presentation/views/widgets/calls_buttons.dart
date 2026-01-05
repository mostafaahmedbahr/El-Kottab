import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/main_imports.dart';

import '../../../../chat/presentation/views/chat_view.dart';

class CallsButtons extends StatelessWidget {
  const CallsButtons({
    super.key,
    required this.teacherName,
    required this.teacherImage,
    required this.teacherId,
  });

  final String teacherName;
  final String teacherImage;
  final int teacherId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomButton(
                height: 40.h,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      SvgImages.phone,
                      colorFilter: ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      LangKeys.voiceCall.tr(),
                      style: AppStyles.white12SemiBold,
                    ),
                  ],
                ),
              ),
            ),
            Gap(12.w),
            Expanded(
              child: CustomButton(
                height: 40.h,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      SvgImages.video,
                      height: 20.h,
                      colorFilter: ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      LangKeys.videoCall.tr(),
                      style: AppStyles.white12SemiBold,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Gap(12.w),
        CustomButton(
          width: 200.w,
          height: 40.h,
          onPressed: () {
            AppNav.customNavigator(
              context: context,
              screen: ChatView(
                teacherId: teacherId,
                teacherImage: teacherImage,
                teacherName: teacherName,
                userId: CacheHelper.getData(key: "userId"),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                SvgImages.chat,
                height: 20.h,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
              Text(LangKeys.chat.tr(), style: AppStyles.white12SemiBold),
            ],
          ),
        ),
      ],
    );
  }
}
