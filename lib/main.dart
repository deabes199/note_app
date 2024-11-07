import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/core/routing/app_router.dart';
import 'package:note_app/core/routing/routes.dart';
import 'package:note_app/add_note/models/note_model.dart';
import 'package:note_app/core/widgets/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: appRouter.genrateRoute,
      initialRoute: Routes.addNote,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
    );
  }
}
