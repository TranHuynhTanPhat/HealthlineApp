import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthline/app/app_controller.dart';
import 'package:healthline/presentation/resources/string_manager.dart';
import 'package:healthline/util/translate.dart';
import 'package:restart_app/restart_app.dart';

import '../cubits/cubit_application_update/application_update_cubit.dart';
import 'components/export.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _showDownloadingBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(StringManager.downloading.translate(context)),
        actions: const [LoadingIndicator()],
      ),
    );
  }

  Future<void> _downloadUpdate() async {
    _showDownloadingBanner();

    await Future.wait([
      AppController.instance.shorebirdCodePush.downloadUpdateIfAvailable(),
      // Add an artificial delay so the banner has enough time to animate in.
      Future<void>.delayed(const Duration(milliseconds: 250)),
    ]);

    if (!mounted) return;

    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    _showRestartBanner();
  }

  void _showRestartBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(StringManager.newReadyPatch.translate(context)),
        actions: [
          TextButton(
            // Restart the app for the new patch to take effect.
            onPressed: Restart.restartApp,
            child: Text(StringManager.restartApp.translate(context)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<ApplicationUpdateCubit, ApplicationUpdateState>(
      listener: (context, state) {
        if (state is UpdateAvailable) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(StringManager.availableUpdate.translate(context)),
            ),
          );
        } else if (state is UpdateUnavailable) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(StringManager.noAvailableUpdate.translate(context)),
            ),
          );
        }
      },
      child: BlocBuilder<ApplicationUpdateCubit, ApplicationUpdateState>(
        builder: (context, state) {
          final heading = state.currentPatchVersion != null
              ? '${state.currentPatchVersion}'
              : StringManager.noPatchedInstall.translate(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: theme.colorScheme.inversePrimary,
              title: Text(StringManager.updateApplication.translate(context)),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(StringManager.currentPatchVersion.translate(context)),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          heading,
                          style: theme.textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (!state.isShorebirdAvailable)
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            StringManager.cantConnectToCurrentVersion
                                .translate(context),
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.error,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  if (state.isShorebirdAvailable)
                    if (state is UpdateAvailable)
                      ElevatedButton(
                        onPressed: () async {
                          await _downloadUpdate();
                          if (!mounted) return;
                          ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner();
                        },
                        child: Text(StringManager.updateNow.translate(context)),
                      )
                    else
                      ElevatedButton(
                        onPressed: state.isCheckingForUpdate
                            ? null
                            : () => context
                                .read<ApplicationUpdateCubit>()
                                .checkForUpdate(),
                        child: state.isCheckingForUpdate
                            ? const LoadingIndicator()
                            : Text(
                                StringManager.checkUpdate.translate(context)),
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
