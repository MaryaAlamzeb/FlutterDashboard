import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  final bool isCollapsed;
  final VoidCallback onToggle;

  const Sidebar({Key? key, required this.isCollapsed, required this.onToggle})
      : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _hoveredIndex = -1;
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: widget.isCollapsed ? 60 : 250,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: widget.onToggle,
                ),
                if (!widget.isCollapsed)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      '../../assets/images/logo.jpeg',
                      height: 50,
                    ),
                  ),
              ],
            ),
          ),
          // Sidebar Items
          Expanded(
            child: ListView(
              children: [
                _buildNavItem(0, Icons.dashboard, "Dashboard"),
                _buildNavItem(1, Icons.wallet, "Budget"),
                _buildNavItem(2, Icons.arrow_back_outlined, "Transactions"),
                _buildNavItem(4, Icons.report, "Reports"),
                _buildNavItem(5, Icons.calendar_view_day_outlined, "Planning"),
                _buildNavItem(6, Icons.person, "Consultants"),
                _buildNavItem(7, Icons.info, "Info Portal"),
                _buildNavItem(8, Icons.settings, "Settings"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(color: Colors.grey.shade400, thickness: 1),
                ),
                _buildNavItem(9, Icons.security, "Security"),
                _buildNavItem(10, Icons.help, "Help Center"),
                _buildNavItem(
                  11,
                  Icons.dark_mode_outlined,
                  "Dark Mode",
                  trailing: Switch(
                    value: _isDarkMode,
                    activeColor: const Color.fromARGB(255, 81, 80, 84),
                    onChanged: (bool value) {
                      setState(() {
                        _isDarkMode = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String title,
      {Widget? trailing}) {
    bool isHovered = _hoveredIndex == index;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = -1),
      child: Container(
        color: isHovered
            ? const Color.fromARGB(255, 129, 99, 239)
            : Colors.transparent,
        child: ListTile(
          leading: Icon(
            icon,
            color: isHovered ? Colors.white : Colors.black,
          ),
          title: widget.isCollapsed
              ? null
              : Text(
                  title,
                  style: TextStyle(
                    color: isHovered ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          trailing: widget.isCollapsed ? null : trailing,
          onTap: () {},
        ),
      ),
    );
  }
}
