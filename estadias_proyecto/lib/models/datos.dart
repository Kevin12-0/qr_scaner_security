class Datos {
  String Name;
  String Apelliddos;

  Datos({this.Name, this.Apelliddos});

  factory Datos.fromJSON(Map<String, dynamic> map) { 
    return Datos(
      Name : map['Name'],
      Apelliddos : map['Apelliddos']
    );
  }
}