import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:talentaku_app/constants/app_sizes.dart';
import 'package:talentaku_app/controllers/laporan_siswa_controller.dart';
import 'package:talentaku_app/widgets/welcome_sign.dart';
import 'package:talentaku_app/widgets/laporan_siswa_card.dart';

class LaporanSiswaScreen extends StatelessWidget {
  const LaporanSiswaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LaporanSiswaController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: AppSizes.spaceL),
            const WelcomeSign(),
            SizedBox(height: AppSizes.spaceL),

            // Filter Dropdown
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
              child: Theme(
                data: Theme.of(context).copyWith(
                  popupMenuTheme: PopupMenuThemeData(
                    color: AppColors.cardBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusL),
                    ),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(AppSizes.radiusL),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 10,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Obx(() => DropdownButtonFormField<String>(
                        value: controller.selectedFilter.value,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: AppSizes.paddingL,
                            vertical: AppSizes.paddingM,
                          ),
                          prefixIcon: Icon(
                            Icons.filter_list,
                            color: AppColors.primary,
                          ),
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.primary,
                        ),
                        style: AppTextStyles.bodyMedium,
                        dropdownColor: AppColors.cardBackground,
                        items: controller.filterOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) controller.filterLaporan(value);
                        },
                      )),
                ),
              ),
            ),
            SizedBox(height: AppSizes.spaceM),

            // Laporan List
            Expanded(
              child: Obx(() {
                if (controller.filteredLaporan.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/logo.png',
                          width: AppSizes.iconL * 3,
                          height: AppSizes.iconL * 3,
                        ),
                        SizedBox(height: AppSizes.spaceM),
                        Text(
                          'Tidak ada laporan pada periode ini',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textPrimary.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
                  itemCount: controller.filteredLaporan.length,
                  itemBuilder: (context, index) {
                    return LaporanSiswaCard(
                      laporan: controller.filteredLaporan[index],
                      index: index,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
