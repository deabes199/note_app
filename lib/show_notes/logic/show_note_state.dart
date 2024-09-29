part of 'show_note_cubit.dart';

@immutable
sealed class ShowNoteState {}

final class NoteInitial extends ShowNoteState {}

final class NoteSuccess extends ShowNoteState {}
