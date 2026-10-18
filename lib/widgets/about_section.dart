import 'package:flutter/material.dart';
import '../data/personal_data.dart';
import '../data/skills_data.dart';
import '../theme/app_theme.dart';
import 'section_heading.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Container(
      width: double.infinity,
      color: AppTheme.mainBackground,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? screenWidth * 0.1 : 24,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            title: 'Professional Profile',
            subtitle: 'ABOUT ME',
          ),
          Text(
            PersonalData.aboutProfile,
            style: const TextStyle(
              fontSize: 16,
              height: 1.8,
              color: AppTheme.secondaryText,
            ),
          ),
          const SizedBox(height: 64),
          const Text(
            'Core Competencies',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryText,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: coreCompetencies.map((comp) => Chip(
              label: Text(comp),
              backgroundColor: AppTheme.secondaryBackground,
              side: const BorderSide(color: Color(0xFFE2E8F0)),
              labelStyle: const TextStyle(
                color: AppTheme.primaryText,
                fontWeight: FontWeight.w500,
              ),
            )).toList(),
          ),
          const SizedBox(height: 64),
          const Text(
            'Skills & Technologies',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryText,
            ),
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: skillsData.entries.map((entry) {
                  return SizedBox(
                    width: isDesktop ? (constraints.maxWidth - 48) / 3 : constraints.maxWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.key,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryText,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: entry.value.map((skill) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: const Color(0xFFE2E8F0)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              skill,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppTheme.secondaryText,
                              ),
                            ),
                          )).toList(),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }
          ),
        ],
      ),
    );
  }
}
