import 'package:flutter/material.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_sizes.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';



class DetailLaporanCard extends StatelessWidget {
  final String title;
  final dynamic content;
  final IconData icon;
  final bool isExpanded;
  final VoidCallback onTap;
  final String status;

  const DetailLaporanCard({
    Key? key,
    required this.title,
    required this.content,
    required this.icon,
    required this.isExpanded,
    required this.onTap,
    required this.status,
  }) : super(key: key);

  Color _getStatusColor() {
    switch (status) {
      case '1':
        return Colors.green;
      case '2':
        return Colors.orange;
      case '3':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText() {
    switch (status) {
      case '1':
        return 'Muncul';
      case '2':
        return 'Kurang';
      case '3':
        return 'Tidak Muncul';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.paddingL),
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
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.all(AppSizes.paddingL),
          childrenPadding: EdgeInsets.only(
            left: AppSizes.paddingL,
            right: AppSizes.paddingL,
            bottom: AppSizes.paddingL,
          ),
          title: Row(
            children: [
              Container(
                width: AppSizes.detailIconSize,
                height: AppSizes.detailIconSize,
                padding: EdgeInsets.all(AppSizes.paddingS),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primary,
                  size: AppSizes.iconM,
                ),
              ),
              SizedBox(width: AppSizes.paddingM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (title != 'Unggah Foto') ...[
                      SizedBox(height: AppSizes.spaceXS),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.paddingS,
                          vertical: AppSizes.paddingXS,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor().withOpacity(0.1),
                          borderRadius: BorderRadius.circular(AppSizes.radiusS),
                        ),
                        child: Text(
                          _getStatusText(),
                          style: AppTextStyles.bodySmall.copyWith(
                            color: _getStatusColor(),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          children: [
            if (title == 'Kegiatan Inti' && content is List) ...[
              _buildKegiatanIntiContent(List<Map<String, dynamic>>.from(content))
            ] else if (title == 'Unggah Foto' && content is String) ...[
              _buildPhotoContent(content)
            ] else ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
                child: Text(
                  content.toString(),
                  style: AppTextStyles.bodyMedium,
                ),
              ),
            ],
            SizedBox(height: AppSizes.spaceM),
          ],
          onExpansionChanged: (_) => onTap(),
          initiallyExpanded: isExpanded,
        ),
      ),
    );
  }

  Widget _buildKegiatanIntiContent(List<Map<String, dynamic>> kegiatanList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: kegiatanList.asMap().entries.map((entry) {
        int index = entry.key + 1;
        Map<String, dynamic> kegiatan = entry.value;
        return Padding(
          padding: EdgeInsets.only(bottom: AppSizes.spaceM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kegiatan $index',
                style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: AppSizes.spaceS),
              Text(
                'Kegiatan: ${kegiatan['kegiatan']}',
                style: AppTextStyles.bodyMedium
              ),
              SizedBox(height: AppSizes.spaceXS),
              Text(
                'Hasil: ${kegiatan['hasil']}',
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPhotoContent(String photoUrl) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse(photoUrl));
      },
      child: Text(
        photoUrl,
        style: AppTextStyles.bodyMedium.copyWith(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
