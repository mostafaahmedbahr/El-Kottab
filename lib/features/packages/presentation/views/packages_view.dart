import 'package:easy_localization/easy_localization.dart';
import 'package:el_kottab/core/app_services/remote_services/service_locator.dart';
import 'package:el_kottab/features/packages/data/repos/packages_repo_imple.dart';
import 'package:el_kottab/features/packages/presentation/view_model/packages_cubit.dart';
import 'package:el_kottab/features/packages/presentation/view_model/packages_states.dart';
import 'package:el_kottab/features/packages/presentation/views/widgets/currency_dialog.dart';
import 'package:el_kottab/features/packages/presentation/views/widgets/custom_code_filed.dart';
import 'package:el_kottab/features/packages/presentation/views/widgets/packages_list.dart';
import 'package:el_kottab/main_imports.dart';

import '../../../../core/utils/enums.dart';

class PackagesView extends StatelessWidget {
  const PackagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>PackagesCubit(getIt.get<PackagesRepoImpl>())..getAllPackages(),
      child: BlocConsumer<PackagesCubit , PackagesStates>(
        listener: (context,state){},
        builder:  (context,state){
          var packagesCubit = context.read<PackagesCubit>();
          return Scaffold(
            appBar: AppBar(title: Text(LangKeys.packages.tr()),
              actions: [
                BlocBuilder<PackagesCubit, PackagesStates>(
                  builder: (context, state) {
                    final cubit = PackagesCubit.get(context);

                    return IconButton(
                      icon: SvgPicture.asset(
                        cubit.selectedCurrency == Currency.egp
                            ? SvgImages.egp
                            : SvgImages.dollar,
                      ),
                      onPressed: () {
                        showCurrencyDialog(
                          context: context,
                          selectedCurrency: cubit.selectedCurrency,
                          onSelected: (currency) {
                            cubit.changeCurrency(currency);
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
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
        },
      ),
    );
  }
}
