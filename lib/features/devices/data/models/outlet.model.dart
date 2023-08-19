class OutletModel {
  final String id;
  final String label;
  final String ip;
  final bool isTaken;

  OutletModel({
    required this.id,
    required this.label,
    required this.ip,
    this.isTaken = false,
  });
}