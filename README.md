
[![CI Status](https://img.shields.io/travis/BandarHL/BHVideoManager.svg?style=flat)](https://travis-ci.org/BandarHL/BHVideoManager)
[![Version](https://img.shields.io/cocoapods/v/BHVideoManager.svg?style=flat)](https://cocoapods.org/pods/BHVideoManager)
[![License](https://img.shields.io/cocoapods/l/BHVideoManager.svg?style=flat)](https://cocoapods.org/pods/BHVideoManager)
[![Platform](https://img.shields.io/cocoapods/p/BHVideoManager.svg?style=flat)](https://cocoapods.org/pods/BHVideoManager)

# BHVideoManager
Video tool manager

# Future:
- Trim video or audio.
- Convert audio to video.
- Convert video to audio.
- Merge video with audio.
- Export video with different quality.

# Export video with different quality
- for example i have mp4 file(old.mp4 (720p)) i want to convert video quality to 480p:
```objective-c
    NSString *documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
    NSURL *filePath = [[NSURL fileURLWithPath:documentsDirectoryPath] URLByAppendingPathComponent:@"old.mp4"];
    // you can select another quality by typing AVAssetExportPreset and xcode will show you :)
    [BHVideoManager ExportVideo:filePath WithQuality:AVAssetExportPreset640x480 SaveFileToPath:[NSURL fileURLWithPath:documentsDirectoryPath] TitleFile:@"videoExported" CompletionHandler:^(AVAssetExportSession *exportsession) {
    if (AVAssetExportSessionStatusFailed == exportsession.status) {
    NSLog(@"faild:%@", exportsession.error);
    } else if (AVAssetExportSessionStatusCompleted == exportsession.status) {
    NSLog(@"Done");
    }
    }];
```

# Trim Audio

- for example i have m4a file(CleanBandit-Rockabye.m4a) i want trim half of time:
 ``` objective-c
 NSString *documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
 NSURL *filePath = [[NSURL fileURLWithPath:documentsDirectoryPath] URLByAppendingPathComponent:@"CleanBandit-Rockabye.m4a"];
 
 AVURLAsset *asset = [AVURLAsset URLAssetWithURL:filePath options:nil];
 
 [BHVideoManager TrimAudioWithPath:filePath StartTime:kCMTimeZero EndTime:CMTimeMake(asset.duration.value /2, asset.duration.timescale) SaveFileToPath:[NSURL fileURLWithPath:documentsDirectoryPath] TitleFile:@"test" CompletionHandler:^(AVAssetExportSession *exportsession) {
 if (AVAssetExportSessionStatusFailed == exportsession.status) {
 NSLog(@"faild:%@", exportsession.error);
 } else if (AVAssetExportSessionStatusCompleted == exportsession.status) {
 NSLog(@"Done");
 }
 }];
```


# Trim Video

- for example i have mp4 file(old.mp4) i want trim half of time:
``` objective-c
NSString *documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
NSURL *filePath = [[NSURL fileURLWithPath:documentsDirectoryPath] URLByAppendingPathComponent:@"old.mp4"];
AVURLAsset *asset = [AVURLAsset URLAssetWithURL:filePath options:nil];

[BHVideoManager TrimVideoWithPath:filePath StartTime:kCMTimeZero EndTime:CMTimeMake(asset.duration.value/2, asset.duration.timescale) SaveFileToPath:[NSURL fileURLWithPath:documentsDirectoryPath] TitleFile:@"test2" CompletionHandler:^(AVAssetExportSession *exportsession) {
if (AVAssetExportSessionStatusFailed == exportsession.status) {
NSLog(@"faild:%@", exportsession.error);
} else if (AVAssetExportSessionStatusCompleted == exportsession.status) {
NSLog(@"Done");
}
}];
```

# Merge video with audio
``` objective-c
NSString *documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
NSURL *VideofilePath = [[NSURL fileURLWithPath:documentsDirectoryPath] URLByAppendingPathComponent:@"test2.mp4"];
NSURL *audioFilePath = [[NSURL fileURLWithPath:documentsDirectoryPath] URLByAppendingPathComponent:@"test.m4a"];

[BHVideoManager MergeVideo:VideofilePath WithAudio:audioFilePath SaveFileToPath:[NSURL fileURLWithPath:documentsDirectoryPath] TitleFile:@"VideoMerged" CompletionHandler:^(AVAssetExportSession *exportsession) {
if (AVAssetExportSessionStatusFailed == exportsession.status) {
NSLog(@"faild:%@", exportsession.error);
} else if (AVAssetExportSessionStatusCompleted == exportsession.status) {
NSLog(@"Done");
}
}];
```


# Convert Video to audio

- for example i have mp4 file(test2.mp4):
``` objective-c
NSString *documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
NSURL *filePath = [[NSURL fileURLWithPath:documentsDirectoryPath] URLByAppendingPathComponent:@"test2.mp4"];

[BHVideoManager ConvertVideoToAudioWithPath:filePath SaveFileToPath:[NSURL fileURLWithPath:documentsDirectoryPath] TitleFile:@"VideoConverted" CompletionHandler:^(AVAssetExportSession *exportsession) {
if (AVAssetExportSessionStatusFailed == exportsession.status) {
NSLog(@"faild:%@", exportsession.error);
} else if (AVAssetExportSessionStatusCompleted == exportsession.status) {
NSLog(@"Done");
}
}];
```

# Convert Audio to Video

- for example i have m4a file(VideoConverted.m4a):
``` objective-c
NSString *documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
NSURL *filePath = [[NSURL fileURLWithPath:documentsDirectoryPath] URLByAppendingPathComponent:@"VideoConverted.m4a"];

[BHVideoManager ConvertAudioToVideoWithPath:filePath SaveFileToPath:[NSURL fileURLWithPath:documentsDirectoryPath] TitleFile:@"AudioConverted" CompletionHandler:^(AVAssetExportSession *exportsession) {
if (AVAssetExportSessionStatusFailed == exportsession.status) {
NSLog(@"faild:%@", exportsession.error);
} else if (AVAssetExportSessionStatusCompleted == exportsession.status) {
NSLog(@"Done");
}
}];
```
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

BHVideoManager is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BHVideoManager'
```

## Author

BandarHL, bandarhl

## License

BHVideoManager is available under the MIT license. See the LICENSE file for more info.
