import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tasks_app/lib.exports.dart'; // ajuste o caminho para o correto
import 'package:mockito/annotations.dart';

import 'tasks_local.datasource_test.mocks.dart';

@GenerateMocks([ILocalStorageDriver])
void main() {
  late TasksLocalDatasource datasource;
  late MockILocalStorageDriver mockLocalStorageDriver;
  const storageTag = "tasks-list";

  setUp(() {
    mockLocalStorageDriver = MockILocalStorageDriver();
    datasource = TasksLocalDatasource(storage: mockLocalStorageDriver);
  });

  group('concludeTask', () {
    test('deve marcar a tarefa como concluída', () async {
      // Arrange - - - - - - - - - -
      final initialTask = {"id": 1, "title": "Task 1", "description": "Desc 1", "done": false};
      final expectedUpdatedTask = {"id": 1, "title": "Task 1", "description": "Desc 1", "done": true};
      final initialTasksList = [initialTask];

      when(mockLocalStorageDriver.getList(key: storageTag)).thenAnswer((_) async => initialTasksList);
      when(mockLocalStorageDriver.putList(key: storageTag, list: anyNamed("list"))).thenAnswer((_) async => null);

      // Act - - - - - - - - - - - -
      await datasource.concludeTask(data: {"id": 1});

      // Assert - - - - - - - - - - -
      verify(mockLocalStorageDriver.getList(key: storageTag)).called(1);
      verify(mockLocalStorageDriver.putList(key: storageTag, list: [expectedUpdatedTask])).called(1);
      verifyNoMoreInteractions(mockLocalStorageDriver);
    });

    test('deve lançar exceção se falhar ao concluir tarefa', () async {
      // Arrange - - - - - - - - - -
      when(mockLocalStorageDriver.getList(key: storageTag)).thenThrow(Exception('Erro ao concluir tarefa'));

      // Act - - - - - - - - - - - -
      expect(() => datasource.concludeTask(data: {"id": 1}), throwsA(isA<Exception>()));

      // Assert - - - - - - - - - - -
      verify(mockLocalStorageDriver.getList(key: storageTag)).called(1);
      verifyNoMoreInteractions(mockLocalStorageDriver);
    });
  });
}
