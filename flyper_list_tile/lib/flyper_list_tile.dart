import 'package:flutter/material.dart';
import 'package:hal/hal.dart';

class FlyperListTile extends StatelessWidget {
  const FlyperListTile.fromResource({
    Key? key,
    required this.resource,
    required this.onTap,
  }) : super(key: key);
  final HypertextApplicationLanguageResource resource;
  final VoidCallback? onTap;

  final imageUrl =
      'https://images.unsplash.com/photo-1550305080-4e029753abcf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        resource.getProperty('title') ?? 'Título',
      ),
      subtitle: Text(resource.getProperty('description') ?? 'Descrição'),
      trailing: Image(
        image: NetworkImage(
            resource.getProperty('url_for_illustration') ?? imageUrl),
      ),
      isThreeLine: true,
      enabled: onTap != null,
      onTap: onTap ?? () {},
    );
  }
}
