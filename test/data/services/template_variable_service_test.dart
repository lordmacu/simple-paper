import 'package:flutter_test/flutter_test.dart';
import 'package:office_app/data/services/template_variable_service.dart';

void main() {
  late TemplateVariableService service;

  setUp(() {
    service = TemplateVariableService();
  });

  group('TemplateVariableService', () {
    test('Initializes with default values', () {
      final vars = service.getAllVariables();
      expect(vars['player_name'], 'New Hire');
      expect(vars['boss_name'], 'Michael');
      expect(vars['company_name'], 'Dunder Mifflin');
      expect(vars['city'], 'Scranton');
    });

    test('replaceVariables replaces known variables', () {
      // Usamos una cadena que contenga varias variables
      final text = 'Hello {player_name}, welcome to {company_name} in {city}.';
      final result = service.replaceVariables(text);

      expect(result, contains('New Hire'));
      expect(result, contains('Dunder Mifflin'));
      expect(result, contains('Scranton'));
      // Verificamos el string completo
      expect(result, 'Hello New Hire, welcome to Dunder Mifflin in Scranton.');
    });

    test('updateVariable updates the value', () {
      service.updateVariable('player_name', 'Michael Scott');

      final text = 'Hello {player_name}';
      final result = service.replaceVariables(text);

      expect(result, equals('Hello Michael Scott'));
      expect(service.getVariable('player_name'), 'Michael Scott');
    });

    test('updateAll updates multiple variables', () {
      service.updateAll({'player_name': 'Jim Halpert', 'city': 'Stamford'});

      final text = '{player_name} moves to {city}.';
      final result = service.replaceVariables(text);

      expect(result, equals('Jim Halpert moves to Stamford.'));
    });

    test('Unknown variables in text are not replaced or removed', () {
      final text = 'This is {unknown_var}.';
      final result = service.replaceVariables(text);

      expect(result, equals('This is {unknown_var}.'));
    });

    test('Updating non-existent variable key does nothing', () {
      service.updateVariable('non_existent_key', 'Value');
      expect(service.getVariable('non_existent_key'), '');
    });

    test('replaceVariables handles empty string', () {
      expect(service.replaceVariables(''), '');
    });
  });
}
