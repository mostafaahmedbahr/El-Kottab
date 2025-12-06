
import 'package:el_kottab/core/app_services/remote_services/service_locator.dart';
import 'package:el_kottab/features/home/presentation/view_model/home_cubit.dart';
import 'package:el_kottab/features/home/presentation/views/widgets/best_teachers.dart';
import 'package:el_kottab/features/home/presentation/views/widgets/browse_packages.dart';
import 'package:el_kottab/features/home/presentation/views/widgets/home_slider_images.dart';

import '../../../../main_imports.dart';
import '../../data/repos/home_repo_imple.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context)=>HomeCubit(getIt.get<HomeRepoImpl>()),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: HomeSliderImages(),
              ),
              SliverToBoxAdapter(
                child: const BrowsePackages(),
              ),
              SliverToBoxAdapter(
                child: const BestTeachers(),
              ),
              // SliverToBoxAdapter(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Gap(20.h),
              //       const BestSellerUnits(),
              //     ],
              //   ),
              // ),
              // SliverToBoxAdapter(
              //   child: const ExploreTheSites(),
              // ),
              // SliverToBoxAdapter(
              //   child: const LatestArticles(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}