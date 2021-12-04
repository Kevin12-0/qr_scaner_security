import 'package:supabase/supabase.dart';

class SupabaseInsertsClients {
  static String supabaseURL = 'https://tngqweyzsoryyeewfxdq.supabase.co';
  static String supabaseAPI =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzNzAyMjQ1MCwiZXhwIjoxOTUyNTk4NDUwfQ.Vr_NbYgJorKZSoLmgfpwEc7igYfm5a6HmHc5Idc1ewA';
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
