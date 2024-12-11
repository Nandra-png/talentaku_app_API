import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:talentaku_app/constants/app_sizes.dart';
import 'package:talentaku_app/models/date_picker_event.dart';

class DatePickerCard extends StatelessWidget {
  final DatePickerEvent datePickerEvent;

  const DatePickerCard({
    Key? key,
    required this.datePickerEvent,
  }) : super(key: key);

  static Future<DateTime?> show({
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    required Function(DateTime) onDateSelected,
  }) {
    return Get.dialog<DateTime>(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusL),
        ),
        child: DatePickerCard(
          datePickerEvent: DatePickerEvent(
            initialDate: initialDate,
            firstDate: firstDate,
            lastDate: lastDate,
            onDateSelected: onDateSelected,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.paddingXL),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Pilih Tanggal',
            style: AppTextStyles.heading3,
          ),
          SizedBox(height: AppSizes.spaceL),
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(AppSizes.radiusL),
            ),
            child: Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColors.primary,
                  onPrimary: AppColors.textLight,
                  surface: AppColors.cardBackground,
                  onSurface: AppColors.textPrimary,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                  ),
                ),
              ),
              child: CalendarDatePicker(
                initialDate: datePickerEvent.initialDate,
                firstDate: datePickerEvent.firstDate,
                lastDate: datePickerEvent.lastDate,
                onDateChanged: (date) {
                  datePickerEvent.onDateSelected(date);
                  Get.back(result: date);
                },
              ),
            ),
          ),
          SizedBox(height: AppSizes.spaceL),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  'Batal',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              SizedBox(width: AppSizes.paddingM),
              ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusM),
                  ),
                ),
                child: Text(
                  'Tutup',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 