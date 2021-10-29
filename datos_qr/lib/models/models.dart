import 'package:supabase/supabase.dart';

class SupabaseInserts {
  static String supabaseURL = 'https://btuoufefhitjxkokehcv.supabase.co';
  static String supabaseAPI =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMjA4ODg2NiwiZXhwIjoxOTQ3NjY0ODY2fQ.ZiTSw9IpT6xK1cuamn5UnViCvzprpl0nQX1QOtouwZo';

  final client = SupabaseClient(supabaseURL, supabaseAPI);

  addData(String nameValue, String apellidoValue, String descripcionValue, String calleValue) {
    var response = client.from('registros_codigos').insert({
      'Name': nameValue,
      'Apellidos': apellidoValue,
      'Descripcion': descripcionValue,
      'Calle': calleValue
    }).execute();
    print(response);
  }
}
