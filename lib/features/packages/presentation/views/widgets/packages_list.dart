import 'package:el_kottab/features/packages/presentation/view_model/packages_cubit.dart';
import 'package:el_kottab/features/packages/presentation/view_model/packages_states.dart';
import 'package:el_kottab/features/packages/presentation/views/widgets/packages_list_item.dart';
import 'package:el_kottab/main_imports.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PackagesList extends StatelessWidget {
  const PackagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackagesCubit , PackagesStates>(
      builder: (context,state){
        var packagesCubit = context.read<PackagesCubit>();
        bool enableLoading = packagesCubit.packagesModel==null || state is GetAllPackagesLoadingState;
        return  Skeletonizer(
            enabled : enableLoading,
          child: Padding(
            padding:   EdgeInsets.all(12.0.r),
            child: ListView.separated(
              itemBuilder: (context,index){
                return PackagesListItem(
                  package:  packagesCubit.packagesModel?.data?[index],
                );
              },
              separatorBuilder: (context,index){
                return Gap(12.h);
              },
              itemCount: enableLoading ?  10 : packagesCubit.packagesModel!.data!.length,
            ),
          ),
        );
      },

    );
  }
}
