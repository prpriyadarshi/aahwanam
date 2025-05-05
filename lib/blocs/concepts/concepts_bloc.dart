import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class ConceptsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadConceptBlogs extends ConceptsEvent {}

// States
abstract class ConceptsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ConceptsInitial extends ConceptsState {}

class ConceptsBlogLoaded extends ConceptsState {
  final List<Map<String, String>> horizontal_blogs;
  final List<Map<String, String>> vertical_blogs;
  final List<Map<String, String>> blogs;
  final List<String> trendImages; // <-- New field

  ConceptsBlogLoaded(this.blogs,this.horizontal_blogs,this.vertical_blogs,this.trendImages);

  @override
  List<Object> get props => [blogs,horizontal_blogs,vertical_blogs,trendImages];

}

// Bloc
class ConceptsBloc extends Bloc<ConceptsEvent, ConceptsState> {
  ConceptsBloc() : super(ConceptsInitial()) {
    on<LoadConceptBlogs>((event, emit) async {
      final horizontal_blogs = [
        {
          'imageUrl': 'assets/images/blog1.png',
          'title': 'Aesthetic decor ',
          'description': 'Lorem ipsum dolor sit amet, conse adipiscing elit, sed do eiusmod..',
          'date': '9 March, 2025',
        },
        {
          'imageUrl': 'assets/images/blog2.png',
          'title': 'Aesthetic decor',
          'description': 'Lorem ipsum dolor sit amet, conse adipiscing elit, sed do eiusmod.',
          'date': '9 March, 2025',
        },
        {
          'imageUrl': 'assets/images/blog3.png',
          'title': 'Aesthetic decor',
          'description': 'Lorem ipsum dolor sit amet, conse adipiscing elit, sed do eiusmod.',
          'date': '9 March, 2025',
        },
        {
          'imageUrl': 'assets/images/Choreographer.png',
          'title': 'Aesthetic decor',
          'description': 'Lorem ipsum dolor sit amet, conse adipiscing elit, sed do eiusmod.',
          'date': '9 March, 2025',
        },
      ];
      final vertical_blogs = [
        {
          'imageUrl': 'assets/images/vertical_blog1.png',
          'title': 'Aesthetic decor ',
          'description': 'Lorem ipsum dolor sit amet, conse adipiscing elit, sed do eiusmod..',
          'date': '9 March, 2025',
        },
        {
          'imageUrl': 'assets/images/vertical_blog2.png',
          'title': 'Aesthetic decor',
          'description': 'Lorem ipsum dolor sit amet, conse adipiscing elit, sed do eiusmod.',
          'date': '9 March, 2025',
        },
        {
          'imageUrl': 'assets/images/vertical_blog3.png',
          'title': 'Aesthetic decor',
          'description': 'Lorem ipsum dolor sit amet, conse adipiscing elit, sed do eiusmod.',
          'date': '9 March, 2025',
        },
        {
          'imageUrl': 'assets/images/vertical_blog4.png',
          'title': 'Aesthetic decor',
          'description': 'Lorem ipsum dolor sit amet, conse adipiscing elit, sed do eiusmod.',
          'date': '9 March, 2025',
        },
      ];
      final blogs = [
        {
          'imageUrl': 'assets/images/trendy_blog1.png',
          'title': 'Aesthetic decor ',
          'description': 'Lorem ipsum dolor sit amet, conse adipiscing elit, sed do eiusmod..',
          'date': '9 March, 2025',
        },
        {
          'imageUrl': 'assets/images/trendy_blog2.png',
          'title': 'Aesthetic decor',
          'description': 'Lorem ipsum dolor sit amet, conse adipiscing elit, sed do eiusmod.',
          'date': '9 March, 2025',
        },
        {
          'imageUrl': 'assets/images/trendy_blog3.png',
          'title': 'Aesthetic decor',
          'description': 'Lorem ipsum dolor sit amet, conse adipiscing elit, sed do eiusmod.',
          'date': '9 March, 2025',
        },

      ];
      final trendImages = [
        'assets/images/trends1.png',
        'assets/images/trends2.png',
        'assets/images/trends3.png',
        'assets/images/trends4.png',
        'assets/images/trends5.png',
        // 'assets/images/vertical_blog5.png',
        // 'assets/images/vertical_blog6.png',
      ];

      emit(ConceptsBlogLoaded(blogs,horizontal_blogs,vertical_blogs,trendImages));
    });
  }
}
