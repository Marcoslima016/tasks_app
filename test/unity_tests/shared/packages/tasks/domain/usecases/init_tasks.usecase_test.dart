import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:tasks_app/lib.exports.dart';
import 'init_tasks.usecase_test.mocks.dart';

@GenerateMocks([GetAllTasks, TasksRepository])
void main() {
  late MockTasksRepository mockTasksRepository;
  late MockGetAllTasks mockGetAllTasks;
  late InitTasks initTasks;

  setUp(() {
    mockTasksRepository = MockTasksRepository();
    mockGetAllTasks = MockGetAllTasks();
    initTasks = InitTasks(
      tasksRepository: mockTasksRepository,
      usecaseGetAllTasks: mockGetAllTasks,
    );
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
    when(mockGetAllTasks.call()).thenAnswer((_) async => Future.value(tasks));

    final result = await initTasks.call();

    expect(result, tasks);
    verify(mockGetAllTasks.call()).called(1);
    verifyNoMoreInteractions(mockGetAllTasks);
  });

  test('deve lançar uma exceção quando falhar', () async {
    when(mockGetAllTasks.call()).thenThrow(Exception('Erro ao obter as tarefas'));

    expect(() => initTasks.call(), throwsA(isA<Exception>()));

    verify(mockGetAllTasks.call()).called(1);
    verifyNoMoreInteractions(mockGetAllTasks);
  });
}
