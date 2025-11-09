import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 253, 199, 118),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: const Text('Flutter Tips', style: TextStyle(
                color: Colors.black,
                fontSize: 26,
              ),),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text('Build your career with ahmed mahmoud', style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 20,
              ),),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete, color:  Colors.black.withOpacity(0.7),
              size: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text('May 21,2022', style: TextStyle(
                fontSize: 16,
                color:  Colors.black.withOpacity(0.5),
                ),
              ),
          ),
          ], 
        ),
      ),
    );
  }
}
