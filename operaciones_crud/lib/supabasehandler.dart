import 'package:supabase/supabase.dart';

class SupabaseHandler {
  static String supabaseURL = 'https://btuoufefhitjxkokehcv.supabase.co';
  static String supabaseKEY =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMjA4ODg2NiwiZXhwIjoxOTQ3NjY0ODY2fQ.ZiTSw9IpT6xK1cuamn5UnViCvzprpl0nQX1QOtouwZo';

  final client = SupabaseClient(supabaseURL, supabaseKEY);

  addData(String taskValue, bool statusValue) {
    var response = client
        .from('todostable')
        .insert({'task': taskValue, 'status': statusValue}).execute();
    print(response);
  }

  readData() async {
    var response = await client
        .from('todostable')
        .select()
        .order('task', ascending: true)
        .execute();
    print(response);
    final dataList = response.data as List;
    return dataList;
  }

  updateData(int id, bool statusValue) {
    var response = client
        .from('todostable')
        .update({'status': statusValue})
        .eq('id', id)
        .execute();
    print(response);
  }

  deleteData(int id) {
    var response = client.from('todostable').delete().eq('id', id).execute();
    print(response);
  }
}
