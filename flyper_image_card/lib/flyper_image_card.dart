import 'package:hal/hal.dart';
import 'package:flutter/material.dart';

class RESTfulNewsImageListTile extends StatelessWidget {
  const RESTfulNewsImageListTile.fromResource({
    Key? key,
    required this.resource,
    required this.onTap,
  }) : super(key: key);
  final HypertextApplicationLanguageResource resource;
  final VoidCallback onTap;

  final _imageUrl =
      'https://images.unsplash.com/photo-1550305080-4e029753abcf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80';

  String get categoryLabel => resource.getProperty('label') ?? 'Categoria';
  String get title => resource.getProperty('title') ?? 'Título';
  String get subtitle => resource.getProperty('description') ?? 'Descrição';
  String get imageUrl =>
      resource.getProperty('url_for_illustration') ??
      'https://images.unsplash.com/photo-1550305080-4e029753abcf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          SizedBox(
            width: 250,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 4,
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SizedBox(
                          height: 120,
                          width: 250,
                          child: Image(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(imageUrl),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          categoryLabel,
                          style: Theme.of(context).textTheme.caption,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.headline6,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          subtitle,
                          style: Theme.of(context).textTheme.subtitle1,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: GestureDetector(
                // splashColor: Colors.black26,
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
