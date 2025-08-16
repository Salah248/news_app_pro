import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_pro/data/model/news_model.dart';
import 'package:news_app_pro/data/services/dio_services.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  void getNews({String? category = 'travel'}) async {
    emit(NewsLoading());
    final response = await DioServices().getNews(category!);
    if (response != null) {
      emit(NewsSuccess(response: response));
    } else {
      emit(NewsError(message: 'Failed to load news'));
    }
  }
}
