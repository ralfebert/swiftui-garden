default:
  just -l

xc:
	open SwiftUIGarden.xcodeproj

build-sim:
	xcodebuild -project SwiftUIGarden.xcodeproj -scheme SwiftUIGarden -configuration Debug -destination 'platform=iOS Simulator,name=iPhone 16' build -quiet

co:
    just format
    fork commit

FORMATTER_OPTIONS := "--swiftversion 5.10 --disable preferForLoop,unusedArguments,blankLinesAtStartOfScope,blankLinesAtEndOfScope,andOperator,redundantSelf,redundantStaticSelf,redundantInternal,preferKeyPath,redundantLet,swiftTestingTestCaseNames"

format:
	swiftformat {{FORMATTER_OPTIONS}} Views Snippets SnippetsIPad Animations Navigation

pngcrush:
	find . -name "*.png" -type f -exec pngcrush -ow {} \;

sync:
	just format
	ruby tools/update-xcode-to-md.rb
	just format
