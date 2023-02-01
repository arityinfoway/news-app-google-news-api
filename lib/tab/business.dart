import 'package:flutter/material.dart';
import 'package:news/block/business_block.dart';
import 'package:news/block/topnews_block.dart';
import 'package:news/config/config.dart';
import 'package:news/model/topnews.dart';
import 'package:news/utils/empty_image.dart';
import 'package:news/utils/loading_card.dart';
import 'package:news/widgets/loading_indicator_widget.dart';
import 'package:news/widgets/news.dart';
import 'package:provider/provider.dart';

class Business extends StatefulWidget {
  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> {

  @override
  void initState() {
    super.initState();
    if (this.mounted) {
      if (context.read<BusinessNewsBlock>().topNews.isEmpty) {
        context.read<BusinessNewsBlock>().fetchData(mounted);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final cb = context.watch<BusinessNewsBlock>();
    return RefreshIndicator(
        child: cb.hasData == false
            ? ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            EmptyPageWithImage(image: Config.noDocument, title: 'no contents found'.trim())
          ],
        )
            : ListView.separated(
          padding: EdgeInsets.all(15),
          itemCount: cb.topNews.length != 0 ? cb.topNews.length : 5,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 15,
          ),
          shrinkWrap: true,
          itemBuilder: (_, int index) {
            if (cb.topNews.isEmpty && cb.hasData == true) {
              return LoadingCard(height: 150);
            } else if (index < cb.topNews.length) {
              // return NewsWidget(
              //   child: Text(cb.topNews[index].content.toString()),
              // );
              return NewsWidget(
                  article: cb.topNews[index]
              );
            }
            return Opacity(opacity: cb.isLoading == true ? 1.0 : 0.0, child: LoadingIndicatorWidget());
          },
        ),
        onRefresh: () async {
          cb.onReload(mounted);
        });
  }
}
