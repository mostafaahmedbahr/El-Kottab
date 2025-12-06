import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/features/packages/presentation/views/widgets/custom_code_filed.dart';
import 'package:el_kottab/features/packages/presentation/views/widgets/packages_list.dart';
import 'package:el_kottab/main_imports.dart';

class PackagesView extends StatelessWidget {
  const PackagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LangKeys.packages.tr()),
      actions: [
        IconButton(onPressed: (){},
            icon: SvgPicture.asset(SvgImages.dollar))
      ],),
      body: PackagesList(),
      bottomNavigationBar: Container(
        height: 130.h,
        padding: EdgeInsets.all(12.r),
        color: AppColors.grayLightest.withValues(alpha: .5),
        child: Column(
          children: [
            Text(
              LangKeys.customCodes.tr(),
              style: AppStyles.black16SemiBold,
            ),
            Gap(12.h),
            CustomCodeFormField(
              controller: TextEditingController(),
              onAdd: (value) {
                print('Added code: $value');

              },
              hintText: LangKeys.writePackageCode.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
