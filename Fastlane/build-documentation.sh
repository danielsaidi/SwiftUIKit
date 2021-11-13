#!/bin/sh

rm -rf Docs
mkdir -p Docs

xcodebuild docbuild \
    -scheme SwiftUIKit \
    -destination generic/platform=iOS \

echo "Copying documentation archive..."

find ~/Library/Developer/Xcode/DerivedData \
    -name "SwiftUIKit.doccarchive" \
    -exec cp -R {} Docs \;

cd Docs

echo "Compressing documentation archive..."

zip -r \
    SwiftUIKit.doccarchive.zip \
    SwiftUIKit.doccarchive

rm -rf SwiftUIKit.doccarchive

cd ..
