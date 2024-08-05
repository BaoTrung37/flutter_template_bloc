first_run:
	fvm use 3.22.3
	@cp .\assets\env\.env.example .\assets\env\.env
	@cp .\assets\env\.env.example .\assets\env\.env.dev
	make rebuild

clean:
	fvm flutter clean

get-dependencies:
	fvm flutter pub get

upgrade-dependencies:
	fvm flutter pub upgrade --major-versions

build-runner:
	fvm flutter pub run build_runner build

watch-runner:
	fvm flutter pub run build_runner watch

build-runner-delete:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

watch-runner-delete:
	fvm flutter pub run build_runner watch --delete-conflicting-outputs

gen-l10n:
	fvm flutter gen-l10n --no-nullable-getter   

gen-flavor:
	fvm flutter pub run flutter_flavorizr

build-apk-dev:
	fvm flutter build apk --flavor dev -t lib/main_dev.dart

build-apk-prod:
	fvm flutter build apk --flavor prod -t lib/main_prod.dart

rebuild:
	make clean
	make get-dependencies
	make build-runner-delete
	make gen-l10n