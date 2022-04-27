import 'package:flutter/material.dart';
import 'package:tmdb_app/components/staff/staff_card.dart';
import 'package:tmdb_app/models/credits/staff.dart';

class StaffList extends StatelessWidget {
  const StaffList({Key? key, required this.staff}) : super(key: key);

  final List<Staff> staff;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        Staff staffPerson = staff[index];

        return StaffCard(
          imgSrc: staffPerson.profilePath,
          name: staffPerson.name,
          role: staffPerson.character ?? staffPerson.job ?? '',
        );
      },
      itemCount: staff.length,
    );
  }
}
