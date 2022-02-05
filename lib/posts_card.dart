import 'package:flutter/material.dart';

import 'insta_post_model.dart';
import 'insta_post_theme.dart';

class PostCard extends StatelessWidget {
  final String? id;
  final String? mediaType;
  final String? caption;
  final String? username;
  final String? timestamp;
  const PostCard(
      {this.id,
      this.mediaType,
      this.username,
      this.timestamp,
      this.caption,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Image.network(
                mediaType!,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              Row(
                children: [
                  Text(
                    username!,
                    style: InstaPostTheme.lightTextTheme.headline3,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    caption!,
                    style: InstaPostTheme.lightTextTheme.headline4,
                  ),
                ],
              ),
              Text(
                timestamp!,
                style: InstaPostTheme.lightTextTheme.headline4,
              )
            ],
          )),
    );
  }
}
