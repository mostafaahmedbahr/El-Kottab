import 'package:el_kottab/core/utils/app_nav.dart';
import 'package:el_kottab/features/balance/presentation/views/balance_view.dart';
import 'package:el_kottab/features/change_password/presentation/views/change_password_view.dart';
import 'package:el_kottab/features/profile/presentation/views/widgets/profile_list_item.dart';
import '../../../../../main_imports.dart';

class ProfileListItems extends StatelessWidget {
  const ProfileListItems({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.darkOlive.withValues(alpha: .2),
      ),
      child: Column(
        children: [
          ProfileListItem(
            title: LangKeys.balance,
            svgImage: SvgImages.dollar,
            onTap: (){
              AppNav.customNavigator(context: context, screen: BalanceView());
            },
          ),
          ProfileListItem(
            title: LangKeys.changePassword,
            svgImage: SvgImages.lock,
            onTap: (){
              AppNav.customNavigator(context: context, screen: ChangePasswordView());
            },
          ),
          ProfileListItem(
            title: LangKeys.aboutUs,
            svgImage: SvgImages.warning,
            onTap: (){},
          ),
          ProfileListItem(
            title: LangKeys.contactUs,
            svgImage: SvgImages.callCalling,
            onTap: (){},
          ),
          ProfileListItem(
            title: LangKeys.settings,
            svgImage: SvgImages.settings,
            onTap: (){},
          ),
          ProfileListItem(
            isLast: true,
            title: LangKeys.privacyAndTerms,
            svgImage: SvgImages.terms,
            onTap: (){},
          ),



        ],
      ),
    );
  }
}