import 'package:flutter/material.dart';
import '../widgets/app_navigation.dart';
import '../widgets/profile_hero.dart';
import '../widgets/about_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/education_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {
    'Home': GlobalKey(),
    'About': GlobalKey(),
    'Experience': GlobalKey(),
    'Projects': GlobalKey(),
    'Education': GlobalKey(),
    'Contact': GlobalKey(),
  };

  void _scrollToSection(String section) {
    final key = _sectionKeys[section];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      appBar: isDesktop ? AppNavigation(
        sectionKeys: _sectionKeys,
        onNavigate: _scrollToSection,
      ) : AppBar(
        title: const Text('Md Nazmus Sakib', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      drawer: isDesktop ? null : MobileDrawer(
        sectionKeys: _sectionKeys,
        onNavigate: _scrollToSection,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            ProfileHero(key: _sectionKeys['Home'], onNavigate: _scrollToSection),
            AboutSection(key: _sectionKeys['About']),
            ExperienceSection(key: _sectionKeys['Experience']),
            ProjectsSection(key: _sectionKeys['Projects']),
            EducationSection(key: _sectionKeys['Education']),
            ContactSection(key: _sectionKeys['Contact']),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
