part of 'todo_item_cubit.dart';

@immutable
sealed class TodoitemState {}

final class TodoitemInitial extends TodoitemState {}

final class TodoItemLoading extends TodoitemState {}

final class TodoItemSuccess extends TodoitemState {}
