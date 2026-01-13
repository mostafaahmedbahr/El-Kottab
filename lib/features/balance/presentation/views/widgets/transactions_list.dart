import 'package:el_kottab/features/balance/presentation/views/widgets/transaction_card.dart';
import '../../../../../main_imports.dart';
import '../../../../profile/presentation/view_model/profile_cubit.dart';
import '../../../../profile/presentation/view_model/profile_states.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit , ProfileStates>(
        builder: (context,state){
          var profileCubit = context.read<ProfileCubit>();
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: 1,
            separatorBuilder: (context, index) => Gap( 12.h),
            itemBuilder: (context, index) {
              return TransactionCard(plan: profileCubit.profileModel!.data!.plan!,);
            },
          );
        }

    );
  }
}


