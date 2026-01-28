import 'package:shared_preferences/shared_preferences.dart';

class HistoryService {
  static const String _key = 'completed_workouts';

  static Future<void> logWorkout() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList(_key) ?? [];

    String today = DateTime.now().toIso8601String().split('T')[0];

    if (!history.contains(today)) {
      history.add(today);
      await prefs.setStringList(_key, history);
    }
  }

  static Future<List<DateTime>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList(_key) ?? [];
    return history.map((s) => DateTime.parse(s)).toList();
  }
}