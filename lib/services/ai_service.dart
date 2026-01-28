import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/exercise.dart';

class AIService {
  static final model = GenerativeModel(
    model: 'gemini-3-flash-preview',
    apiKey: dotenv.env['GEMINI_API_KEY'] ?? '',
  );

  static Future<List<Exercise>> getWorkout(String mood) async {
    final prompt = """
ROLE: You are an Elite Aesthetic Physique Coach specializing in Hypertrophy and V-Taper development.

USER CONTEXT:
- Height: 168cm, Weight: 60kg , Waist: 28 Inches (Goal: Lean Bulk to 65kg).
- Current Split: 6-Day V-Taper (Monday: Chest/Shoulders Focus).
- Training Style: High intensity, 3-second eccentric (slow lowering) for maximum muscle fiber recruitment.

TASK:
Generate a workout session for today based on the user's mood: "$mood".
If the mood is "Tired", reduce volume (sets/reps) but maintain intensity. 
If "Energetic", increase intensity or add a drop set.

CONSTRAINTS:
1. Focus on the lateral deltoids and upper lats to build width.
2. Return 3-4 exercises for each muscle group of that day.
3. OUTPUT ONLY A VALID JSON ARRAY. No markdown, no backticks, no preamble.

JSON SCHEMA:
[
  {
    "name": "Exercise Name",
    "sets": "number as string",
    "reps": "number as string",
    "muscleGroup": "Target Muscle"
  }
]
""";

    try {
      final response = await model.generateContent([Content.text(prompt)]);

      final rawText = response.text ?? '[]';

      final String cleanJson = rawText
          .replaceAll('```json', '')
          .replaceAll('```', '')
          .trim();

      final List<dynamic> decoded = jsonDecode(cleanJson);

      return decoded.map((item) => Exercise.fromJson(item)).toList();
    } catch (e) {
      print("Gemini API Error: $e");
      return [];
    }
  }
}