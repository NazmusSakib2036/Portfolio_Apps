class Experience {
  final String position;
  final String organization;
  final String? institution;
  final String period;
  final String? status;
  final List<String> responsibilities;

  const Experience({
    required this.position,
    required this.organization,
    this.institution,
    required this.period,
    this.status,
    required this.responsibilities,
  });
}
