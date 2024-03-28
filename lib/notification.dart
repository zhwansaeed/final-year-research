import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationItem> notifications = [
    NotificationItem(
      title: 'New Message',
      description: 'You have a new message from John Doe.',
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      isRead: false, // Marked as unread by default
    ),
    NotificationItem(
      title: 'Reminder',
      description: 'Don\'t forget to submit your assignment by tomorrow.',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      isRead: false, // Marked as unread by default
    ),
    NotificationItem(
      title: 'Alert',
      description: 'Emergency maintenance scheduled for tonight.',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      isRead: false, // Marked as unread by default
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightBlue[900],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: notifications.isEmpty
          ? const Center(child: Text('No notifications'))
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: notifications[index].isRead
                          ? Colors.black // Blue border for read notifications
                          : Colors.red, // Red border for unread notifications
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      notifications[index].title,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      notifications[index].description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Text(
                      _formatTimestamp(notifications[index].timestamp),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        notifications[index].isRead =
                            true; // Mark notification as read
                      });
                      _showNotificationDetails(context, notifications[index]);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            notifications.clear();
          });
        },
        child: const Icon(Icons.clear_all),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return '3 hours ago'; // Placeholder for timestamp formatting
  }

  void _showNotificationDetails(
      BuildContext context, NotificationItem notification) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(notification.title),
          content: Text(notification.description),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class NotificationItem {
  final String title;
  final String description;
  final DateTime timestamp;
  bool isRead; // Indicates whether the notification is read or unread

  NotificationItem({
    required this.title,
    required this.description,
    required this.timestamp,
    this.isRead = false, // Default value is false (unread)
  });
}

void main() {
  runApp(const MaterialApp(
    home: NotificationPage(),
  ));
}
