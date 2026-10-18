import 'package:url_launcher/url_launcher.dart';
import '../data/personal_data.dart';

class ContactService {
  final bool isConfigured = false;

  Future<bool> submitForm({
    required String name,
    required String email,
    required String phone,
    required String subject,
    required String type,
    required String message,
  }) async {
    if (!isConfigured) {
      return false;
    }
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<void> launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: PersonalData.primaryEmail,
      query: 'subject=Portfolio Contact',
    );
    if (!await launchUrl(emailLaunchUri)) {
      throw Exception('Could not launch email');
    }
  }

  Future<void> launchPhone() async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: PersonalData.phone,
    );
    if (!await launchUrl(phoneLaunchUri)) {
      throw Exception('Could not launch phone');
    }
  }

  Future<void> launchWhatsApp() async {
    final Uri whatsappLaunchUri = Uri.parse("https://wa.me/${PersonalData.whatsapp.replaceAll(RegExp(r'[^0-9]'), '')}");
    if (!await launchUrl(whatsappLaunchUri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch WhatsApp');
    }
  }
}
