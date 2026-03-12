import 'dart:io';
import 'package:fruitify_dashboard/core/services/cloud_storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements CloudStorageService {
  final _supabase = Supabase.instance.client;

  @override
  Future<String> uploadFile(File file, String path) async {
    final fileName = path + file.path.split(Platform.pathSeparator).last;
    await _supabase.storage.from('images').upload(fileName, file);
    final String publicUrl = _supabase.storage
        .from('images')
        .getPublicUrl(fileName);
    return publicUrl;
  }
}
