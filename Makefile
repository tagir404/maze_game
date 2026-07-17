.PHONY: apk aab clean

apk:
	flutter build apk --release

aab:
	flutter build appbundle --release

clean:
	flutter clean
	flutter pub get