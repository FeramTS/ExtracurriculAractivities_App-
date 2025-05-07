import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;
  bool _notificationsEnabled = true;
  int _selectedShape = 0;
  String _currentLanguage = 'Русский';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          
          _buildThemeSwitchTile(),
          const SizedBox(height: 16),
          
          
          _buildNotificationSwitchTile(),
          const SizedBox(height: 16),
          
          
          _buildLanguageSelector(),
        ],
      ),
    );
  }

  Widget _buildThemeSwitchTile() {
    return Card(
      elevation: 2,
      child: SwitchListTile(
        title: const Text('Темная тема'),
        subtitle: const Text('Переключение между светлой и темной темой'),
        secondary: Icon(
          _isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
          color: _isDarkMode ? Colors.blueAccent : Colors.orange,
        ),
        value: _isDarkMode,
        onChanged: (bool value) {
          setState(() {
            _isDarkMode = value;
          });
        },
      ),
    );
  }

  

  Widget _buildNotificationSwitchTile() {
    
    return Card(
      elevation: 2,
      child: SwitchListTile(
        title: const Text('Уведомления'),
        subtitle: const Text('Включить/выключить уведомления'),
        secondary: Icon(
          _notificationsEnabled ? Icons.notifications_active : Icons.notifications_off,
          color: _notificationsEnabled ? Colors.green : Colors.grey,
        ),
        value: _notificationsEnabled,
        onChanged: (bool value) {
          setState(() {
            _notificationsEnabled = value;
          });
        },
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return Card(
      elevation: 2,
      child: ListTile(
        title: const Text('Язык'),
        subtitle: Text(_currentLanguage),
        leading: const Icon(Icons.language),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          _showLanguageDialog();
        },
      ),
    );
  }

  void _showLanguageDialog() {
    final languages = ['Русский', 'English', 'Español', 'Deutsch'];
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Выберите язык'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: languages.map((language) => ListTile(
            title: Text(language),
            trailing: _currentLanguage == language 
                ? const Icon(Icons.check, color: Colors.blue)
                : null,
            onTap: () {
              setState(() => _currentLanguage = language);
              Navigator.pop(context);
            },
          )).toList(),
        ),
      ),
    );
  }
}