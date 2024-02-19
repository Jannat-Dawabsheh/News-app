import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/utils/route/app_routes.dart';
import 'package:news_app/view_models/home/home_cubit.dart';
import 'package:news_app/views/home/widgets/top_headlines_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit=BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<HomeCubit,HomeState>(
              bloc: cubit,
              buildWhen: (previous,current)=>
              current is TopHeadlinesLoading||
              current is TopHeadlinesLoaded||
              current is TopHeadlinesError
              ,
              builder: (context,state){
                if(state is TopHeadlinesLoading){
                  return const CircularProgressIndicator.adaptive();
                }else if(state is TopHeadlinesLoaded){
                  final topHeadlinesArticles=state.topHeadlinesApiResponse.articles;
                  return SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: topHeadlinesArticles.length,
                      itemBuilder: (context,index){
                        final article=topHeadlinesArticles[index];
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, AppRoutes.article, arguments: article);
                            },
                            child: TopHeadlinesItem(article: article)),
                        );
                      }
                    ),
                  );
                }else if(state is TopHeadlinesError){
                    return Text(state.message);
                    
                }else{
                    return const SizedBox.shrink();
                }
                
              }
              
              )
          ],
        ),
      )
    );
  }
}