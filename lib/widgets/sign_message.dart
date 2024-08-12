import 'package:flutter/material.dart';
import 'package:flutter_integration_example/widgets/button.dart';
import 'package:flutter_integration_example/widgets/copyable_text.dart';
import 'package:flutter_integration_example/widgets/input.dart';

class AuthenticatedState extends StatelessWidget {
  final String walletId;
  final String walletAddress;
  final String? recoveryShare;
  final String messageToSign;
  final ValueChanged<String> setMessageToSign;
  final VoidCallback handleSignMessage;
  final String signedMessage;
  final bool isLoading;

  const AuthenticatedState({
    super.key,
    required this.walletId,
    required this.walletAddress,
    this.recoveryShare,
    required this.messageToSign,
    required this.setMessageToSign,
    required this.handleSignMessage,
    required this.signedMessage,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          CopyableText(label: 'Wallet ID', value: walletId),
          CopyableText(label: 'Wallet Address', value: walletAddress),
          if (recoveryShare != null) CopyableText(label: 'Recovery Share', value: recoveryShare!),
          CustomInput(
            value: messageToSign,
            onChanged: setMessageToSign,
            placeholder: 'Enter message to sign',
            multiline: true,
          ),
          CustomButton(
            onPressed: handleSignMessage,
            title: 'Sign Message',
            loading: isLoading,
          ),
          if (signedMessage.isNotEmpty) CopyableText(label: 'Signed Message', value: signedMessage),
        ],
      ),
    );
  }
}
