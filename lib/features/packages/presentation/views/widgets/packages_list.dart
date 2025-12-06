import 'package:el_kottab/features/packages/presentation/views/widgets/packages_list_item.dart';
import 'package:el_kottab/main_imports.dart';

class PackagesList extends StatelessWidget {
  const PackagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.all(12.0.r),
      child: ListView.separated(
          itemBuilder: (context,index){
            return PackagesListItem();
          },
          separatorBuilder: (context,index){
            return Gap(12.h);
          },
          itemCount: 10,
      ),
    );
  }
}
