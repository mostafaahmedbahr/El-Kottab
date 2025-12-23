import 'package:el_kottab/features/packages/presentation/view_model/packages_cubit.dart';
import 'package:el_kottab/features/packages/presentation/view_model/packages_states.dart';
import 'package:el_kottab/features/packages/presentation/views/widgets/packages_list_item.dart';
import 'package:el_kottab/main_imports.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PackagesList extends StatelessWidget {
  const PackagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackagesCubit, PackagesStates>(
      builder: (context, state) {
        var packagesCubit = context.read<PackagesCubit>();

        // Better state checking
        final bool isLoading = state is GetAllPackagesLoadingState;
        final bool hasData = packagesCubit.packagesModel?.data != null;
        final bool enableLoading = isLoading || !hasData;

        // Safely get data length or use 0
        final int itemCount = hasData
            ? packagesCubit.packagesModel!.data!.length
            : 0;

        return Skeletonizer(
          enabled: enableLoading,
          child: Padding(
            padding: EdgeInsets.all(12.0.r),
            child: ListView.separated(
              itemBuilder: (context, index) {
                if (enableLoading) {
                  // Return skeleton item when loading
                  return PackagesListItem(
                    package: null, // Pass null for skeleton
                  );
                } else if (hasData) {
                  // Safely access data with null checks
                  final package = packagesCubit.packagesModel?.data?[index];
                  if (package != null) {
                    return PackagesListItem(
                      package: package,
                    );
                  }
                }
                // Fallback to empty container if something goes wrong
                return const SizedBox.shrink();
              },
              separatorBuilder: (context, index) {
                return Gap(12.h);
              },
              itemCount: enableLoading ? 10 : itemCount,
            ),
          ),
        );
      },
    );
  }
}