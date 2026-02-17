import 'package:flutter/services.dart' show rootBundle;

abstract class FileDataSource {
  Future<List<List<dynamic>>> readCsv(String path);
}

class CsvFileDataSource implements FileDataSource {
  @override
  Future<List<List<dynamic>>> readCsv(String path) async {
    try {
      final fileContent = await rootBundle.loadString(path);
      
      final lines = fileContent.split('\n');
      
      List<List<dynamic>> rows = [];
      
      for (var line in lines) {
        if (line.trim().isNotEmpty) {
          rows.add(line.split(','));
        }
      }
      return rows;
    } catch (e) {
      throw Exception("Failed to read CSV file: $e");
    }
  }
}