
help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
			IFS=$$'#' ; \
			help_split=($$help_line) ; \
			help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
			help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
			printf "%-30s %s\n" $$help_command $$help_info ; \
	done

fresh: ## Runs `clean`, `codegen-build`, and `generate-intl` for a fresh setup.
	make codegen-root

pubget-leapv:
	(flutter pub get;)

codegen-root:
	(flutter clean;flutter pub get;dart run build_runner build --delete-conflicting-outputs)

codegen-watch:
	(dart run build_runner watch --delete-conflicting-outputs)

pub-run:
	dart run build_runner build --delete-conflicting-outputs

clean: ## Cleans Flutter project.  dart run build_runner build --delete-conflicting-outputs
	rm -f pubspec.lock
	rm -f ios/Podfile.lock
	fvm flutter clean
	fvm flutter pub get
	cd ios && pod repo update && pod install --verbose && cd ..
	# dart run build_runner build --delete-conflicting-outputs
	
analyze: ## Runs `flutter analyze`.
	flutter analyze

build-apk: ## Builds Flutter project.  
	fvm flutter build apk

format: ## Formats dart files.
	dart format .

test: ## Runs unit tests.
	flutter tes

run: ## Runs app
	fvm dart pub global activate flutterfire_cli
	fvm flutter run -v

flutterfire: ## Runs flutterfire
	fvm dart pub global activate flutterfire_cli

shore-r:
	shorebird release android --flutter-version=3.22.3
	shorebird release ios --flutter-version=3.22.3

shore-p:
	shorebird patch --platforms=android --release-version=2.7.8+87
	shorebird patch --platforms=ios 

start: 
	dart pub global activate flutterfire_cli
	flutter gen-l10n
	dart pub global activate spider
	flutter pub get
	cd ios
	pod install
	cd ..
	flutter pub get
	spider build --watch