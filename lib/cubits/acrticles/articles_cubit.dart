import 'package:arboblar_uz/cubits/acrticles/articles_state.dart';
import 'package:arboblar_uz/data/models/article_model/article_model.dart';
import 'package:arboblar_uz/data/models/article_model/articles_fiel_keys.dart';
import 'package:arboblar_uz/data/repositories/articles_reository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:arboblar_uz/data/models/status/form_status.dart';
import 'package:arboblar_uz/data/models/universal_data.dart';
import 'package:arboblar_uz/utils/ui_utils/loading_dialog.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit({required this.articlesRepository})
      : super(
          ArticlesState(
              articles: [
                ArticleModel(
                  addDate: '',
                  artId: 0,
                  hashtag: '',
                  userId: 0,
                  avatar: '',
                  profession: '',
                  views: '',
                  image: '',
                  description: 'describtion',
                  username: '',
                  likes: '',
                  title: 'Title',
                ),
              ],
              articleDetails: ArticleModel(
                  userId: 0,
                  addDate: '',
                  artId: 0,
                  avatar: '',
                  profession: '',
                  views: '',
                  image: '',
                  description: '',
                  hashtag: '',
                  username: '',
                  likes: '',
                  title: ''),
              articleModel: ArticleModel(
                addDate: '',
                artId: 0,
                avatar: '',
                profession: '',
                userId: 0,
                views: '',
                image: '',
                description: '',
                hashtag: '',
                username: '',
                likes: '',
                title: '0',
              ),
              status: FormStatus.pure,
              statusText: 'ok'),
        );

  final ArticlesRepository articlesRepository;

  createWebsite() async {
    emit(state.copyWith(
      status: FormStatus.loading,
      statusText: "",
    ));
    UniversalData response =
        await articlesRepository.createArticles(state.articleModel);
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: "",
        ),
      );
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
        statusText: response.error,
      ));
    }
  }

  getArticles(BuildContext context) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: "",
      ),
    );
    showLoading(context: context);
    UniversalData response = await articlesRepository.getArticles();
    if (context.mounted) hideLoading(context: context);
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: "get_website",
          articleDetails: response.data,
          articleModel: response.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          statusText: response.error,
        ),
      );
    }
  }

  getArticleById(int articlesId) async {
    emit(state.copyWith(
      status: FormStatus.loading,
      statusText: "",
    ));
    UniversalData response =
        await articlesRepository.getArticlesById(articlesId);
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: "get_article_by_id",
          articleDetails: response.data,
        ),
      );
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
        statusText: response.error,
      ));
    }
  }

  updateArticlesField({
    required ArticlesFieldKeys fieldKey,
    required dynamic value,
  }) {
    ArticleModel currentArticles = state.articleModel;

    switch (fieldKey) {
      case ArticlesFieldKeys.add_date:
        {
          currentArticles = currentArticles.copyWith(addDate: value as String);
          break;
        }
      case ArticlesFieldKeys.art_id:
        {
          currentArticles = currentArticles.copyWith(artId: value as int);
          break;
        }
      case ArticlesFieldKeys.avatar:
        {
          currentArticles = currentArticles.copyWith(avatar: value as String);
          break;
        }
      case ArticlesFieldKeys.description:
        {
          currentArticles =
              currentArticles.copyWith(description: value as String);
          break;
        }
      case ArticlesFieldKeys.image:
        {
          currentArticles = currentArticles.copyWith(image: value as String);
          break;
        }
      case ArticlesFieldKeys.likes:
        {
          currentArticles = currentArticles.copyWith(likes: value as String);
          break;
        }
      case ArticlesFieldKeys.profession:
        {
          currentArticles =
              currentArticles.copyWith(profession: value as String);
          break;
        }
      case ArticlesFieldKeys.title:
        {
          currentArticles = currentArticles.copyWith(title: value as String);
          break;
        }
      case ArticlesFieldKeys.user_id:
        {
          currentArticles = currentArticles.copyWith(userId: value as int);
          break;
        }
      case ArticlesFieldKeys.username:
        {
          currentArticles = currentArticles.copyWith(username: value as String);
          break;
        }
      case ArticlesFieldKeys.views:
        {
          currentArticles = currentArticles.copyWith(views: value as String);
          break;
        }
    }

    debugPrint("Articles : ${currentArticles.toString()}");

    emit(state.copyWith(articleModel: currentArticles));
  }
}
