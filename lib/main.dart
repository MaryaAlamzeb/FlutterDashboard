import 'package:finance_dashboard/widgets/dashboardsection.dart';
import 'package:flutter/material.dart';
import 'widgets/sidebar.dart';
import 'widgets/topbar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DashboardScreen(),
  ));
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isSidebarOpen = true;

  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // Sidebar
            Sidebar(
              isCollapsed: !isSidebarOpen,
              onToggle: toggleSidebar,
            ),

            //Dashboard
            Expanded(
              child: Column(
                children: [
                  TopBar(),
                  Expanded(
                    child: Container(
                      color: Colors.grey.shade100,
                      child: const Center(
                        child: DashboardSection(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
