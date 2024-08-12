import 'dart:io';

void main() {
  List<String> tasks = [];
  bool isRunning = true;

  while (isRunning) {
    print('\nSimple To-Do List Application');
    print('a. Add a Task');
    print('b. View All Tasks');
    print('c. Mark a Task as Completed');
    print('d. Delete a Task');
    print('e. Exit');
    print('Enter your choice:');

    String? choice = stdin.readLineSync();
    
    if(choice != null){
      print('You entered: $choice');
    } else {
      print('You entered: null');
    }

    switch(choice) {
      case 'a':
       addTask(tasks: tasks);
      case 'b':
       viewTask(tasks);
      case 'c':
       markTaskAsCompleted(tasks);
      case 'd':
       deleteTask(tasks);
      case 'e':
       isRunning = false;
       print('Thank you for using the application.');
       break;
      default:
       print('Invalid choice. Please try again.');
    } 
  } 

}

void addTask({required List<String> tasks}){
  print('Enter the task:');
  var task = stdin.readLineSync();
  if (task != null && task.isNotEmpty){
    tasks.add(task);
    print('Task added.');
  } else {
    print('Invalid task. Please try again.');
  }
}

void viewTask(List<String> tasks){
  if (tasks.isEmpty){
    print('No tasks available.');
  } else {
    print('\nTasks:');
    for(int i = 0; i < tasks.length; i++){
      print('${i + 1}. ${tasks[i]}');
    }
  }
}

void markTaskAsCompleted(List<String> tasks){
  if(tasks.isEmpty){
    print('No tasks available.');
  } else {
    print('Enter the task number to mark as completed:');
    String? input = stdin.readLineSync();
    int? taskNumber = int.tryParse(input ?? '');

    if(taskNumber != null && taskNumber > 0 && taskNumber <= tasks.length){
      tasks[taskNumber - 1] += ' (completed)';
      print('Task marked as completed.');
    } else {
      print('Invalid task number. Please try again.');
    }
  }
}

void deleteTask(List<String> tasks){
  if(tasks.isEmpty){
    print('No tasks available.');
  } else {
    print('Enter the task number to mark as delete:');
    String? input = stdin.readLineSync();
    int? taskNumber = int.tryParse(input ?? '');

    if(taskNumber != null && taskNumber > 0 && taskNumber <= tasks.length){
      tasks.removeAt(taskNumber - 1);
      print('Task deleted.');
    } else {
      print('Invalid task number. Please try again.');
    }
  }
}