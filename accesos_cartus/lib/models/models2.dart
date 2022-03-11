import 'package:supabase/supabase.dart';

class SupabaseInsertsClients {
  static String supabaseURL = 'https://dkdormbhbebnkyoacqoy.supabase.co';
  static String supabaseAPI =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRrZG9ybWJoYmVibmt5b2FjcW95Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NDU1OTA1NDYsImV4cCI6MTk2MTE2NjU0Nn0.2W4KCjolR03WRZu6wlDfSljkFnzRuDhK7MFFXow1H6w';
  final client = SupabaseClient(supabaseURL, supabaseAPI);

  addCliente(String nombreValue, String contactoValue, String edadValue) {
    var response = client.from('registro_inquilinos').insert({
      'Nombre': nombreValue,
      'Contacto': contactoValue,
      'edad': edadValue
    }).execute();
    print(response);
  }
}
