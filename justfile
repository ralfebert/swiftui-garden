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
FORMATTER_HEADER := '--header "SwiftUI Garden, https://swiftui-garden.com/"'

format:
	swiftformat {{FORMATTER_OPTIONS}} {{FORMATTER_HEADER}} Views Snippets Animations
