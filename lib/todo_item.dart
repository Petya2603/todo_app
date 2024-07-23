import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';

class Todoitem extends StatefulWidget {
  final Task task;
  final Function(Task) onChanged;
  final Function(bool) onCheckBoxChanged;
  final Function() onDeleteItem;

  const Todoitem({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onCheckBoxChanged,
    required this.onDeleteItem,
  });

  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isCompleted
          ? const Color.fromARGB(255, 112, 58, 224)
          : const Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onTap: () {
          setState(() {
            widget.task.isCompleted = !widget.task.isCompleted;
            widget.onCheckBoxChanged(widget.task.isCompleted);
            widget.onChanged(widget.task);
          });
        },
        leading: Checkbox(
          activeColor: const Color.fromARGB(255, 100, 35, 186),
          value: widget.task.isCompleted,
          onChanged: (value) {
            widget.onCheckBoxChanged(value!);
            widget.onChanged(widget.task);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // Yeni Satır widget'ı daha iyi düzenleme için
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Öğeleri yatay olarak hizalayın
              children: [
                Text(
                  widget.task.date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  widget.task
                      .time, // Görev modelinizde zamanın mevcut olduğunu varsayarak
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              widget.task.title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          iconSize: 24,
          icon: const Icon(Icons.delete),
          onPressed: widget.onDeleteItem,
        ),
      ),
    );
  }
}
