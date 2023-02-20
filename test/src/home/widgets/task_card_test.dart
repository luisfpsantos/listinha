import 'package:flutter_test/flutter_test.dart';
import 'package:listinha/src/home/widgets/task_card.dart';
import 'package:listinha/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

void main() {
  final board = Taskboard(Uuid.v4(), 'Nova Lista de tarefas 1');

  test('task card ...', () {
    final tasks = [
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), ''),
    ];

    final progess = TaskCard(board: board).getProgess(tasks);

    expect(progess, 0.5);
  });
}
