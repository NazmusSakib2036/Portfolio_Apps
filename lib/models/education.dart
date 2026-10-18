class Education {
  final String degree;
  final String institution;
  final String period;
  final String location;
  final String? result;
  final String? status;
  final String? description;

  const Education({
    required this.degree,
    required this.institution,
    required this.period,
    required this.location,
    this.result,
    this.status,
    this.description,
  });
}
