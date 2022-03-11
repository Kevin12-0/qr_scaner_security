import 'package:supabase/supabase.dart';

class SupabaseInserts {
  static String supabaseURL = 'https://dkdormbhbebnkyoacqoy.supabase.co';
  static String supabaseAPI =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRrZG9ybWJoYmVibmt5b2FjcW95Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NDU1OTA1NDYsImV4cCI6MTk2MTE2NjU0Nn0.2W4KCjolR03WRZu6wlDfSljkFnzRuDhK7MFFXow1H6w';
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
