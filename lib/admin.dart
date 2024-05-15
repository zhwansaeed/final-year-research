import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_location.dart';

class admin1 extends StatelessWidget {
  const admin1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: EdgeInsets.all(20),
              children: [
                DashboardItem(
                  title: 'Profile',
                  icon: Icons.person,
                  onTap: () {
                   
                  },
                ),
                DashboardItem(
                  title: 'Settings',
                  icon: Icons.settings,
                  onTap: () {
                    // Navigate to the settings page
                  },
                ),
                DashboardItem(
                  title: 'Add Location',
                  icon: Icons.settings,
                  onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context)=> addNewLocation()));                  },
                ),
                // Add more dashboard items as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const DashboardItem({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
