import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:yaml_edit/yaml_edit.dart';

void main() {
  final fontsDirectory = Directory('assets/fonts');
  final pubspecFile = File('pubspec.yaml');

  if (!fontsDirectory.existsSync()) {
    if (kDebugMode) {
      print('Fonts directory not found: ${fontsDirectory.path}');
    }
    return;
  }

  if (!pubspecFile.existsSync()) {
    if (kDebugMode) {
      print('pubspec.yaml not found');
    }
    return;
  }

  // Fetch font files
  final fontFiles = fontsDirectory
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.endsWith('.ttf'))
      .toList();

  if (fontFiles.isEmpty) {
    if (kDebugMode) {
      print('No font files found in ${fontsDirectory.path}');
    }
    return;
  }

  // Parse pubspec.yaml
  final pubspecContent = pubspecFile.readAsStringSync();
  final yamlEditor = YamlEditor(pubspecContent);

  final fontsConfig = <String, dynamic>{};
  for (final file in fontFiles) {
    final fileName = file.uri.pathSegments.last;
    final family = fileName.split('-').first;

    fontsConfig.putIfAbsent(family, () => []).add({'asset': file.path});
  }

  // Update pubspec.yaml
  yamlEditor.update(
      ['flutter', 'fonts'],
      fontsConfig.entries.map((entry) {
        return {
          'family': entry.key,
          'fonts': entry.value,
        };
      }).toList());

  pubspecFile.writeAsStringSync(yamlEditor.toString());
  if (kDebugMode) {
    print('Fonts added to pubspec.yaml successfully!');
  }
}
