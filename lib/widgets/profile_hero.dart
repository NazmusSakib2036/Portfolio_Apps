import 'package:flutter/material.dart';
import '../data/personal_data.dart';
import '../theme/app_theme.dart';
import 'statistic_card.dart';

class ProfileHero extends StatelessWidget {
  final Function(String) onNavigate;

  const ProfileHero({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Container(
      width: double.infinity,
      color: AppTheme.secondaryBackground,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? screenWidth * 0.1 : 24,
        vertical: isDesktop ? 120 : 60,
      ),
      child: Column(
        crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.accentBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              PersonalData.availability,
              style: TextStyle(
                color: AppTheme.accentBlue,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            PersonalData.eyebrow,
            style: const TextStyle(
              fontSize: 14,
              letterSpacing: 2,
              fontWeight: FontWeight.w600,
              color: AppTheme.mutedText,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            PersonalData.name,
            textAlign: isDesktop ? TextAlign.left : TextAlign.center,
            style: TextStyle(
              fontSize: isDesktop ? 56 : 40,
              fontWeight: FontWeight.w900,
              color: AppTheme.primaryText,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            PersonalData.headline,
            textAlign: isDesktop ? TextAlign.left : TextAlign.center,
            style: TextStyle(
              fontSize: isDesktop ? 24 : 18,
              fontWeight: FontWeight.w500,
              color: AppTheme.secondaryText,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: isDesktop ? 800 : double.infinity,
            child: Text(
              PersonalData.summary,
              textAlign: isDesktop ? TextAlign.left : TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                height: 1.6,
                color: AppTheme.secondaryText,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: isDesktop ? 800 : double.infinity,
            child: Text(
              PersonalData.supportingDetail,
              textAlign: isDesktop ? TextAlign.left : TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: AppTheme.mutedText,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: isDesktop ? 800 : double.infinity,
            child: Text(
              PersonalData.formerRoleDetail,
              textAlign: isDesktop ? TextAlign.left : TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: AppTheme.mutedText,
              ),
            ),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => onNavigate('Projects'),
                child: const Text('View Projects'),
              ),
              OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('CV PDF is currently unavailable. Please check back later.')),
                  );
                },
                child: const Text('Download CV'),
              ),
              TextButton(
                onPressed: () => onNavigate('Contact'),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  foregroundColor: AppTheme.accentBlue,
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
                child: const Text('Contact Me'),
              )
            ],
          ),
          const SizedBox(height: 64),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
            children: const [
              StatisticCard(value: '3+', label: 'Years Experience'),
              StatisticCard(value: '50+', label: 'Projects'),
              StatisticCard(value: '30+', label: 'Clients'),
            ],
          ),
        ],
      ),
    );
  }
}
