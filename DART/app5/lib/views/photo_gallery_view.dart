import 'package:app5/views/main_popup_menu_button.dart';
import 'package:app5/views/storage_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/app_bloc.dart';

class PhotoGalleryView extends HookWidget {
  const PhotoGalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    final picker = useMemoized(() => ImagePicker(), [key]);
    final images = context.watch<AppBloc>().state.images ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        actions: [
          IconButton(
            onPressed: () async {
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              if (image == null) return;
              // ignore: use_build_context_synchronously
              context.read<AppBloc>().add(
                    AppEventUploadImage(filePathToUpload: image.path),
                  );
            },
            icon: const Icon(Icons.upload),
          ),
          const MainPopupMenuButton(),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(8),
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        children: images
            .map(
              (img) => StorageImageView(image: img),
            )
            .toList(),
      ),
    );
  }
}
