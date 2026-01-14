import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_box/provider/complete_task_provider.dart';
import 'package:task_box/utils/widgets/custom_button.dart';
import 'package:task_box/utils/widgets/custome_home_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDate;

  bool isDataEmpty = false;
  bool isLoading = true;
  String searchText = "";

  final DatabaseReference databaseRef = FirebaseDatabase.instance.ref('Task');

  @override
  void initState() {
    super.initState();

    databaseRef.onValue.listen((event) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
        isDataEmpty = !event.snapshot.exists;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    Future<void> _selectDate() async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)),
      );
      if (pickedDate != null) {
        setState(() {
          selectedDate = pickedDate;
        });
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            CustomeHomeCard(
              onSearch: (value) {
                setState(() {
                  searchText = value.toLowerCase();
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Today's Task",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),

            /// ------------------- BODY -------------------
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : isDataEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.inbox,
                              size: 80,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "No tasks added yet",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      )
                    : FirebaseAnimatedList(
                        query: databaseRef,
                        defaultChild: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        itemBuilder: (context, snapshot, animation, index) {
                          String title = snapshot
                              .child('title')
                              .value
                              .toString();
                          String description = snapshot
                              .child('description')
                              .value
                              .toString();
                          String date = snapshot.child('date').value.toString();

                          if (searchText.isNotEmpty &&
                              !title.toLowerCase().contains(searchText) &&
                              !description.toLowerCase().contains(searchText)) {
                            return const SizedBox.shrink();
                          }
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.surfaceContainerHigh,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  description,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today,
                                          size: 16,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onSurfaceVariant,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          date,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodySmall,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Consumer<CompleteTaskProvider>(
                                          builder:
                                              (
                                                context,
                                                completeTaskProvider,
                                                _,
                                              ) {
                                                final isCompleted =
                                                    completeTaskProvider
                                                        .isTaskCompleted(
                                                          snapshot.key!,
                                                        );

                                                return GestureDetector(
                                                  onTap: () {
                                                    completeTaskProvider
                                                        .toggleTaskCompletion(
                                                          snapshot.key!,
                                                        );
                                                  },
                                                  child: Icon(
                                                    Icons.check_circle,
                                                    color: isCompleted
                                                        ? Colors.green
                                                        : Colors.grey,
                                                  ),
                                                );
                                              },
                                        ),
                                        const SizedBox(width: 10),
                                        InkWell(
                                          onTap: () {
                                            databaseRef
                                                .child(snapshot.key!)
                                                .remove();
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),

      /// ------------------- FAB -------------------
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: "Task Title",
                        hintText: "Task Title",
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerHigh,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      child: TextField(
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        controller: descriptionController,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: "Task Description",
                          hintText: "Task Description",
                          border: const OutlineInputBorder(),
                          filled: true,
                          fillColor: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHigh,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 330,
                      height: 55,
                      child: OutlinedButton(
                        onPressed: _selectDate,
                        child: const Text("Select Date"),
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      onPressd: () {
                        databaseRef
                            .child(
                              DateTime.now().millisecondsSinceEpoch.toString(),
                            )
                            .set({
                              'title': titleController.text.trim(),
                              'description': descriptionController.text.trim(),
                              'date': selectedDate != null
                                  ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                  : 'No date selected',
                            });
                        Navigator.pop(context);
                      },
                      btnText: 'Add Task',
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
