#!/usr/bin/env bash

set -e -o pipefail

xcodebuild -version

function build() {
    xcodebuild -project "MATRIX Utils.xcodeproj" -scheme "MATRIX Utils iOS" -destination "generic/platform=iOS" -configuration "release" ONLY_ACTIVE_ARCH=NO build | xcpretty
    # for cfg in Debug Release; do
    #     xcodebuild \
    #         -project "$FRAMEWORK_NAME.xcodeproj" \
    #         -scheme    "$FRAMEWORK_NAME $1" \
    #         -destination "$2" \
    #         -configuration "$cfg" \
    #         ONLY_ACTIVE_ARCH=NO \
    #         build | xcpretty
    # done
}

# ----- OS: --- Destination:
# build   macOS   "arch=x86_64"
build   iOS     "OS=9.0,name=iPhone 6"
# build   tvOS    "OS=9.0,name=Apple TV 1080p"

pod lib lint --quick