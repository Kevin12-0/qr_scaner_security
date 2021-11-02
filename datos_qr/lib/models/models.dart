import 'package:supabase/supabase.dart';

class SupabaseInserts {
  static String supabaseURL = 'https://btuoufefhitjxkokehcv.supabase.co';
  static String supabaseAPI =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMjA4ODg2NiwiZXhwIjoxOTQ3NjY0ODY2fQ.ZiTSw9IpT6xK1cuamn5UnViCvzprpl0nQX1QOtouwZo';

  final client = SupabaseClient(supabaseURL, supabaseAPI);

  addData(
      String fechaValue,
      String nombreVisitaValue,
      String calleValue,
      String coloniaValue,
      String loteVale,
      String motivoVlue,
      String telefonoValue,
      String acompanantesValue,
      String autorizacionValue) {
    var response = client.from('registros_codigos').insert({
      'Fecha': fechaValue,
      'Nombre de la Visita': nombreVisitaValue,
      'Calle': calleValue,
      'Colonia': coloniaValue,
      'Lote': loteVale,
      'Telefono': telefonoValue,
      'Motivo de la Visita': motivoVlue,
      'No. Acompañantes': acompanantesValue,
      'Nombre Autorización': autorizacionValue
    }).execute();
    print(response);
  }
}
