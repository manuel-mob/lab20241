class Holiday {
  final String name;
  final String comment;
  final String date;
  final String nonNegotiable;
  final String type; 
  
  const Holiday({
    required this.name,
    required this.comment,
    required this.date,
    required this.nonNegotiable,
    required this.type,
  });

  factory Holiday.fromJson(Map<String, dynamic> json) {
    print(json);
    return Holiday(
      name: json['nombre'] as String,
      comment: (json['comentarios'] as String?) ?? "",
      date: json['fecha'] as String,
      nonNegotiable: json['irrenunciable'] as String,
      type: json['tipo'] as String,
    );
  }

}