import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_box/view/profile.dart';

class CustomeHomeCard extends StatelessWidget {
  final Function(String) onSearch;
  const CustomeHomeCard({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

    String formattedDate = DateFormat('EEEE, MMM d').format(date);

    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hey! \nAbdul wahab",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                child: CircleAvatar(
                  radius: 25,
                  child: Icon(Icons.person, size: 40),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            formattedDate,
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 55,
            child: TextField(
              onChanged: (value){
                onSearch(value);
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.primary,
                ),
                hintText: "Search for tasks",

                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainerHigh,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
