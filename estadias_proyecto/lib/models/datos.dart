class Datos {
  String Name;
  String Apellidos;

  Datos({this.Name, this.Apellidos});

  factory Datos.fromJSON(Map<String, dynamic> map) { 
    return Datos(
      Name : map['Name'],
      Apellidos : map['Apellidos']
    );
  }
}