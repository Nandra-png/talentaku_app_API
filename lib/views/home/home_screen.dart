import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_sizes.dart';
import 'package:talentaku_app/controllers/home_controller.dart';
import 'package:talentaku_app/models/program_tambahan_event.dart';
import 'package:talentaku_app/widgets/program_tambahan_card.dart';
import 'package:talentaku_app/widgets/welcome_sign.dart';
import 'package:talentaku_app/widgets/broadcast_card.dart';
import 'package:talentaku_app/widgets/categories_line.dart';
import 'package:talentaku_app/widgets/class_card.dart';
import 'package:talentaku_app/widgets/laporan_preview_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSizes.spaceXS),
              const WelcomeSign(),
              SizedBox(height: AppSizes.spaceXS),

              // Pengumuman
              SizedBox(
                height: AppSizes.broadcastHeight,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.98),
                  itemCount: controller.events.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppSizes.paddingS),
                      child: BroadcastCard(event: controller.events[index]),
                    );
                  },
                ),
              ),

              SizedBox(height: AppSizes.spaceL),

              CategoriesLine(categoryEvent: controller.categories[2]),

              // Laporan Preview
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
                child: SizedBox(
                  height: AppSizes.laporanCardHeight,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.laporanPreviews.length,
                    itemBuilder: (context, index) {
                      return LaporanPreviewCard(
                        laporan: controller.laporanPreviews[index],
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: AppSizes.spaceXL),

              // Categories and Cards
              CategoriesLine(categoryEvent: controller.categories[0]),
              ClassCard(classEvent: controller.classEvents[0]),
              SizedBox(height: AppSizes.spaceXL),

              CategoriesLine(categoryEvent: controller.categories[1]),

              // Program Cards
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
                child: SizedBox(
                  height: AppSizes.horizontalListHeight,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.programDetails.length,
                    itemBuilder: (context, index) {
                      final program = controller.programDetails[index];
                      return ProgramCard(
                        programEvent: ProgramEvent(
                          title: program['title']!,
                          image: program['image']!,
                          description: program['description']!,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: AppSizes.spaceXL),
            ],
          ),
        ),
      ),
    );
  }
}
