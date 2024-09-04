import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tasks_app/lib.exports.dart';

import 'add_new_task.usecase_test.mocks.dart';

@GenerateMocks([TasksRepository, TasksPresenter, GetAllTasks])
void main() {
  late MockTasksRepository mockTasksRepository;
  late MockTasksPresenter mockTasksPresenter;
  late MockGetAllTasks mockGetAllTasks;
  late AddNewTask addNewTask;

  setUp(() {
    mockTasksRepository = MockTasksRepository();
    mockTasksPresenter = MockTasksPresenter();
    mockGetAllTasks = MockGetAllTasks();
    addNewTask = AddNewTask(
      tasksRepository: mockTasksRepository,
      tasksPresenter: mockTasksPresenter,
      usecaseGetAllTasks: mockGetAllTasks,
    );
  });

  test('deve adicionar uma nova tarefa e atualizar a lista de tarefas', () async {
    final payload = PayloadNewTask(
      title: "Nova tarefa",
      description: "Descricao nova tarefa",
    );
    final updatedTasks = [
      Task(
        id: 1,
        title: 'Task 1',
        description: 'Description 1',
        dateTimeCreation: DateTime.now(),
      ),
      Task(
        id: 2,
        title: "Nova tarefa",
        description: "Descricao nova tarefa",
        dateTimeCreation: DateTime.now().add(const Duration(minutes: 1)),
      ),
    ];

    List tasksPresenterUpdatedTasks = [];

    when(mockGetAllTasks.call()).thenAnswer((_) async => updatedTasks);
    when(mockTasksRepository.addNewTask(payload: payload)).thenAnswer((_) async => null);
    when(mockTasksPresenter.setLoadedState(tasksList: updatedTasks)).thenAnswer((_) async {
      tasksPresenterUpdatedTasks = updatedTasks;
    });

    await addNewTask.call(payload: payload);

    expect(tasksPresenterUpdatedTasks, updatedTasks);
    verify(mockTasksRepository.addNewTask(payload: payload)).called(1);
    verify(mockGetAllTasks.call()).called(1);
    verify(mockTasksPresenter.setLoadedState(tasksList: updatedTasks)).called(1);
    verifyNoMoreInteractions(mockTasksRepository);
    verifyNoMoreInteractions(mockGetAllTasks);
    verifyNoMoreInteractions(mockTasksPresenter);
  });

  test('deve lançar uma exceção se ocorrer falha', () async {
    final payload = PayloadNewTask(
      title: "Nova tarefa",
      description: "Descricao nova tarefa",
    );

    when(mockTasksRepository.addNewTask(payload: payload)).thenThrow(Exception('Erro ao adicionar nova tarefa'));

    expect(() => addNewTask.call(payload: payload), throwsA(isA<Exception>()));

    verify(mockTasksRepository.addNewTask(payload: payload)).called(1);
    verifyNoMoreInteractions(mockTasksRepository);
    verifyZeroInteractions(mockGetAllTasks);
    verifyZeroInteractions(mockTasksPresenter);
  });
}
