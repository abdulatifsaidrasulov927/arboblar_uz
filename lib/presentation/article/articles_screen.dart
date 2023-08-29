import 'package:arboblar_uz/cubits/acrticles/articles_cubit.dart';
import 'package:arboblar_uz/cubits/acrticles/articles_state.dart';
import 'package:arboblar_uz/data/models/article_model/article_model.dart';
import 'package:arboblar_uz/presentation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arboblar_uz/data/models/status/form_status.dart';

import 'package:arboblar_uz/utils/ui_utils/error_message_dialog.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    Future.microtask(
        () => BlocProvider.of<ArticlesCubit>(context).getArticles(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.addArticle);
            },
            icon: const Icon(Icons.add),
          )
        ],
        title: const Text("articles"),
      ),
      body: BlocConsumer<ArticlesCubit, ArticlesState>(
        builder: (context, state) {
          return ListView(
            children: [
              ...List.generate(
                state.articles.length,
                (index) {
                  ArticleModel articles = state.articles[index];
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.black,
                            width: 2,
                            style: BorderStyle.solid)),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            articles.title,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(articles.description),
                        ),
                        Text(articles.title),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state.status == FormStatus.failure) {
            showErrorMessage(
              message: state.statusText,
              context: context,
            );
          }
          if (state.statusText == "articles_added") {
            BlocProvider.of<ArticlesCubit>(context).getArticles(context);
          }
          // if (state.status == FormStatus.loading) {
          //   return showLoading(context: context);
          // }
          // if (state.status == FormStatus.success) {
          //   return hideLoading(context: context);
          // }
        },
      ),
    );
  }
}
