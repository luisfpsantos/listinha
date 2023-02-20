import 'package:flutter/material.dart';
import 'package:listinha/src/home/widgets/custon_drawer.dart';
import 'package:listinha/src/home/widgets/task_card.dart';
import 'package:listinha/src/shared/services/realm/models/task_model.dart';
import 'package:listinha/src/shared/widgets/user_image_button.dart';
import 'package:realm/realm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/edit');
        },
        icon: const Icon(Icons.edit),
        label: const Text('Nova lista'),
      ),
      drawer: const CustonDrawer(),
      appBar: AppBar(
        title: const Text('LISTINHA'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButton(),
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 200),
              itemCount: 100,
              itemBuilder: (_, index) {
                final tasks = [
                  Task(Uuid.v4(), '', completed: true),
                  Task(Uuid.v4(), '', completed: true),
                  Task(Uuid.v4(), '', completed: true),
                  Task(Uuid.v4(), '', completed: true),
                ];
                final model = Taskboard(Uuid.v4(), 'Nova Lista de tarefas 1', tasks: tasks);
                return TaskCard(board: model, height: 140);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SegmentedButton<int>(
                  segments: const [
                    ButtonSegment(
                      value: 0,
                      label: Text('Todos'),
                    ),
                    ButtonSegment(
                      value: 1,
                      label: Text('Pendentes'),
                    ),
                    ButtonSegment(
                      value: 2,
                      label: Text('Concluídas'),
                    ),
                    ButtonSegment(
                      value: 3,
                      label: Text('Desativadas'),
                    ),
                  ],
                  selected: const {1},
                  onSelectionChanged: (values) {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
