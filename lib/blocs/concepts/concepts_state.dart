part of 'concepts_bloc.dart';

abstract class ConceptsState {}

class ConceptsInitial extends ConceptsState {}

class ConceptsLoading extends ConceptsState {}

class ConceptsLoaded extends ConceptsState {
  // Example: final List<Concept> concepts;
  // ConceptsLoaded(this.concepts);
}

class ConceptsError extends ConceptsState {
  final String message;
  ConceptsError(this.message);
}
