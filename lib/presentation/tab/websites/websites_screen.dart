import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arboblar_uz/cubits/website/website_cubit.dart';
import 'package:arboblar_uz/data/models/status/form_status.dart';
import 'package:arboblar_uz/data/models/websites/website_model.dart';
import 'package:arboblar_uz/presentation/app_routes.dart';
import 'package:arboblar_uz/utils/ui_utils/error_message_dialog.dart';

class WebsitesScreen extends StatefulWidget {
  const WebsitesScreen({super.key});

  @override
  State<WebsitesScreen> createState() => _WebsitesScreenState();
}

class _WebsitesScreenState extends State<WebsitesScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    Future.microtask(
        () => BlocProvider.of<WebsiteCubit>(context).getWebsites(context));
  }

  List<bool> isFavorite = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.addWebsite);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: BlocConsumer<WebsiteCubit, WebsiteState>(
        builder: (context, state) {
          return ListView(
            children: [
              ...List.generate(state.websites.length, (index) {
                WebsiteModel website = state.websites[index];
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
                          website.name,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(website.link),
                      ),
                      // Image.network(baseUrlForImage + website.image),
                      Row(
                        children: [
                          const SizedBox(
                            width: 24,
                          ),
                          Text(website.author),
                        ],
                      ),
                      Text(website.name),
                      Row(
                        children: [
                          const SizedBox(
                            width: 24,
                          ),
                          Text(website.hashtag),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite),
                          ),
                          Text(website.likes),
                          const SizedBox(
                            width: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              })
            ],
          );
        },
        listener: (context, state) {
          if (state.status == FormStatus.failure) {
            print('>>>>>>>>>>>> ${state.status}');
            showErrorMessage(
              message: state.statusText,
              context: context,
            );
          }
          if (state.statusText == "website_added") {
            BlocProvider.of<WebsiteCubit>(context).getWebsites(context);
          }
        },
      ),
    );
  }
}
