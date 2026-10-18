import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/projects_data.dart';
import '../models/project.dart';
import '../theme/app_theme.dart';
import 'section_heading.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String selectedFilter = 'All';

  final List<String> filters = [
    'All',
    'E-commerce',
    'ERP',
    'Business',
    'Agriculture',
    'Education',
    'Healthcare',
    'UI / Frontend',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    final filteredProjects = selectedFilter == 'All'
        ? projectsData
        : projectsData.where((p) => p.category.contains(selectedFilter)).toList();

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
            title: 'Selected Works',
            subtitle: 'PROJECTS',
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: filters.map((filter) {
                // only show filter if projects exist or it's 'All'
                final count = filter == 'All'
                    ? projectsData.length
                    : projectsData.where((p) => p.category.contains(filter)).length;
                if (count == 0) return const SizedBox.shrink();

                final isSelected = selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: FilterChip(
                    label: Text(filter),
                    selected: isSelected,
                    onSelected: (val) {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    selectedColor: AppTheme.accentBlue,
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: isSelected ? AppTheme.accentBlue : const Color(0xFFE2E8F0),
                    ),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : AppTheme.secondaryText,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = isDesktop ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
              final cardWidth = (constraints.maxWidth - (24 * (crossAxisCount - 1))) / crossAxisCount;

              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: filteredProjects.map((project) => SizedBox(
                  width: cardWidth,
                  child: ProjectCard(project: project),
                )).toList(),
              );
            }
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  Future<void> _launchUrl(BuildContext context) async {
    final url = Uri.parse(project.url);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not launch project URL')),
          );
        }
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch project URL')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.sectionBackground,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                project.category,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondaryText,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              project.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryText,
              ),
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () => _launchUrl(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'View Project',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.accentBlue,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.open_in_new, size: 16, color: AppTheme.accentBlue),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
