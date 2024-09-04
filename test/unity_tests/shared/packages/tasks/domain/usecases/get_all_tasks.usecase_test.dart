import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tasks_app/lib.exports.dart';
import 'get_all_tasks.usecase_test.mocks.dart';

@GenerateMocks([TasksRepository])
void main() {
  late MockTasksRepository mockTasksRepository;
  late GetAllTasks getAllTasks;

  setUp(() {
    mockTasksRepository = MockTasksRepository();
    getAllTasks = GetAllTasks(tasksRepository: mockTasksRepository);
  });

  test('deve retornar uma lista de tarefas quando ocorrer sucesso', () async {
    final tasks = [
      Task(
        id: 1,
        title: 'Task 1',
        description: 'Description 1',
        dateTimeCreation: DateTime.now(),
      ),
      Task(
        id: 2,
        title: 'Task 2',
        description: 'Description 2',
        dateTimeCreation: DateTime.now().add(const Duration(minutes: 5)),
      )
    ];
    when(mockTasksRepository.getAllTasks()).thenAnswer((_) async => tasks);

    final result = await getAllTasks.call();

    expect(result, tasks);
    verify(mockTasksRepository.getAllTasks()).called(1);
    verifyNoMoreInteractions(mockTasksRepository);
  });

  test('deve lançar uma exceção quando a consulta ao repositório falhar', () async {
    when(mockTasksRepository.getAllTasks()).thenThrow(Exception('Erro ao obter as tasks'));

    expect(() => getAllTasks.call(), throwsA(isA<Exception>()));

    verify(mockTasksRepository.getAllTasks()).called(1);
    verifyNoMoreInteractions(mockTasksRepository);
  });
}
