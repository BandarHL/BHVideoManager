//
//  BHVIDEOMANAGERViewController.m
//  BHVideoManager
//
//  Created by BandarHL on 10/11/2019.
//  Copyright (c) 2019 BandarHL. All rights reserved.
//

#import "ViewController.h"
#import <BHVideoManager/BHVideoManager.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)ExportVideo {
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
}

- (void)TrimAudio {
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
}

- (void)TrimVideo {
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
}

- (void)MergeVideoWithAudio {
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
}

- (void)ConvertVideoToAudio {
    NSString *documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
    NSURL *filePath = [[NSURL fileURLWithPath:documentsDirectoryPath] URLByAppendingPathComponent:@"test2.mp4"];

    [BHVideoManager ConvertVideoToAudioWithPath:filePath SaveFileToPath:[NSURL fileURLWithPath:documentsDirectoryPath] TitleFile:@"VideoConverted" CompletionHandler:^(AVAssetExportSession *exportsession) {
    if (AVAssetExportSessionStatusFailed == exportsession.status) {
    NSLog(@"faild:%@", exportsession.error);
    } else if (AVAssetExportSessionStatusCompleted == exportsession.status) {
    NSLog(@"Done");
    }
    }];
}

- (void)ConvertAudioToVideo {
    NSString *documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
    NSURL *filePath = [[NSURL fileURLWithPath:documentsDirectoryPath] URLByAppendingPathComponent:@"VideoConverted.m4a"];

    [BHVideoManager ConvertAudioToVideoWithPath:filePath SaveFileToPath:[NSURL fileURLWithPath:documentsDirectoryPath] TitleFile:@"AudioConverted" CompletionHandler:^(AVAssetExportSession *exportsession) {
    if (AVAssetExportSessionStatusFailed == exportsession.status) {
    NSLog(@"faild:%@", exportsession.error);
    } else if (AVAssetExportSessionStatusCompleted == exportsession.status) {
    NSLog(@"Done");
    }
    }];
}

@end
