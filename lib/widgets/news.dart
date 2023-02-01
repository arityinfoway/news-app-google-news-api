import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:news/model/topnews.dart';
import 'package:news/pages/detail.dart';
import 'package:news/utils/cached_image.dart';
import 'package:intl/intl.dart';

//small card with right sight image
class NewsWidget extends StatelessWidget {
  final Articles article;

  const NewsWidget({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');
    return InkWell(
        child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(5),
                boxShadow: <BoxShadow>[BoxShadow(color: Theme.of(context).shadowColor, blurRadius: 10, offset: Offset(0, 3))]),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            article.title!,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.orange[500]),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            article.content != null ? article.content! : '',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CustomCacheImage(imageUrl: article.urlToImage, radius: 5.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.time,
                      size: 18,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                        formatter.parse(DateFormat("yyyy-mm-dd'T'hh:mm:ss").parse(article.publishedAt!).toString()).toString(),
                      // ,
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            )),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetail(title: article.title != null ? article.title : '',url: article.url,)));
        });
  }
}
