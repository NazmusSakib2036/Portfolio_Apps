import 'package:flutter/material.dart';
import '../data/experience_data.dart';
import '../theme/app_theme.dart';
import 'section_heading.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Container(
      width: double.infinity,
      color: AppTheme.sectionBackground,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? screenWidth * 0.1 : 24,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            title: 'Professional Journey',
            subtitle: 'EXPERIENCE',
          ),
          ...experienceData.map((exp) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  exp.position,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.primaryText,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  [exp.organization, exp.institution].where((e) => e != null).join(' - '),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.accentBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                exp.period,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.mutedText,
                                ),
                              ),
                              if (exp.status != null) ...[
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: AppTheme.secondaryBackground,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    exp.status!,
                                    style: const TextStyle(fontSize: 12, color: AppTheme.secondaryText),
                                  ),
                                ),
                              ]
                            ],
                          ),
                        ],
                      ),
                      if (exp.responsibilities.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        ...exp.responsibilities.map((req) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8, right: 12),
                                    child: Icon(Icons.circle, size: 6, color: AppTheme.mutedText),
                                  ),
                                  Expanded(
                                    child: Text(
                                      req,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        height: 1.6,
                                        color: AppTheme.secondaryText,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ]
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
