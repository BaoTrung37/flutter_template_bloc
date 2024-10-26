#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors
# Feel free to reuse and adapt this script for your own projects

if [[ $# -eq 0 ]]; then
  echo "Error: No environment specified. Use 'dev', 'stg', or 'prod'."
  exit 1
fi

case $1 in
  dev)
    flutterfire config \
      --project=example-flutter-app-e689d \
      --out=lib/config/firebase/firebase_options_dev.dart \
      --ios-bundle-id=com.example.bt.app.dev \
      --ios-out=ios/Runner/dev/GoogleService-Info.plist \
      --android-package-name=com.example.bt.app.dev \
      --android-out=android/app/src/dev/google-services.json
    ;;
  prod)
    flutterfire config \
      --project=template-flutter-prod-app \
      --out=lib/config/firebase/firebase_options_prod.dart \
      --ios-bundle-id=com.example.bt.app \
      --ios-out=ios/Runner/prod/GoogleService-Info.plist \
      --android-package-name=com.example.bt.app \
      --android-out=android/app/src/prod/google-services.json
    ;;
  *)
    echo "Error: Invalid environment specified. Use 'dev', 'stg', or 'prod'."
    exit 1
    ;;
esac