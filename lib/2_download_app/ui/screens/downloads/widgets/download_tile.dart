import 'package:flutter/material.dart';
import 'package:myapp/2_download_app/ui/theme/theme.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return Card(
          child: ListTile(
            title: Text(controller.ressource.name),
            subtitle: Text(
              "${(controller.progress * 100).toStringAsFixed(1)}% completed - ${(controller.progress * controller.ressource.size).toStringAsFixed(1)} of ${controller.ressource.size} MB",
              style: TextStyle(color: AppColors.text),
            ),
            trailing: _buildIcon(controller),
          ),
        );
      },
    );

    // TODO
  }

  Widget _buildIcon(DownloadController ctrl) {
    switch (ctrl.status) {
      case DownloadStatus.notDownloaded:
        return IconButton(
          icon: Icon(Icons.download),
          onPressed: ctrl.startDownload,
        );
      case DownloadStatus.downloading:
        return Icon(Icons.downloading);
      case DownloadStatus.downloaded:
        return Icon(Icons.folder_open);
    }
  }
}
