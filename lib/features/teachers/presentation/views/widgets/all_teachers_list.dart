import 'package:el_kottab/features/teachers/presentation/views/widgets/teachers_list_item.dart';
import 'package:el_kottab/main_imports.dart';

class AllTeachersList extends StatelessWidget {
  const AllTeachersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index){
          return TeachersListItem();
        },
        separatorBuilder: (context,index){
          return Gap(12.h);
        },
        itemCount: 10,
    );
  }
}
