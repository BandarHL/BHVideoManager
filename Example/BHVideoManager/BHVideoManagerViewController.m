//
//  BHVideoManagerViewController.m
//  BHVideoManager
//
//  Created by GoldenApple9 on 08/10/2019.
//  Copyright (c) 2019 GoldenApple9. All rights reserved.
//

#import "BHVideoManagerViewController.h"

@interface BHVideoManagerViewController ()

@end

@implementation BHVideoManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)exTrimAudio {
    NSString *documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
    NSURL *filePath = [[NSURL fileURLWithPath:documentsDirectoryPath] URLByAppendingPathComponent:@"CleanBandit-Rockabye.m4a"];
    
    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:filePath options:nil];
    
    [BHVideoManager TrimAudioWithPath:filePath StartTime:kCMTimeZero EndTime:CMTimeMake(asset.duration.value /2, asset.duration.timescale) SaveFileToPath:[NSURL fileURLWithPath:documentsDirectoryPath] TitleFile:@"test" CompletionHandler:^{
        NSLog(@"done");
    }];
}

- (void)exTrimVideo {
    NSString *documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
    NSURL *filePath = [[NSURL fileURLWithPath:documentsDirectoryPath] URLByAppendingPathComponent:@"old.mp4"];
    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:filePath options:nil];
    
    [BHVideoManager TrimVideoWithPath:filePath StartTime:kCMTimeZero EndTime:CMTimeMake(asset.duration.value/2, asset.duration.timescale) SaveFileToPath:[NSURL fileURLWithPath:documentsDirectoryPath] TitleFile:@"test2" CompletionHandler:^{
        NSLog(@"Done");
    }];
}

- (void)exMergeVideoWithAudio {
    NSString *documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
    NSURL *VideofilePath = [[NSURL fileURLWithPath:documentsDirectoryPath] URLByAppendingPathComponent:@"test2.mp4"];
    NSURL *audioFilePath = [[NSURL fileURLWithPath:documentsDirectoryPath] URLByAppendingPathComponent:@"test.m4a"];
    
    [BHVideoManager MergeVideo:VideofilePath WithAudio:audioFilePath SaveFileToPath:[NSURL fileURLWithPath:documentsDirectoryPath] TitleFile:@"VideoMerged" CompletionHandler:^{
        NSLog(@"Done");
    }];
}

- (void)exConvertVideoToAudio {
    NSString *documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
    NSURL *filePath = [[NSURL fileURLWithPath:documentsDirectoryPath] URLByAppendingPathComponent:@"test2.mp4"];
    
    [BHVideoManager ConvertVideoToAudioWithPath:filePath SaveFileToPath:[NSURL fileURLWithPath:documentsDirectoryPath] TitleFile:@"VideoConverted" CompletionHandler:^{
        NSLog(@"Done");
    }];
}

- (void)exConvertAudioToVideo {
    
    NSString *documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)[0];
    NSURL *filePath = [[NSURL fileURLWithPath:documentsDirectoryPath] URLByAppendingPathComponent:@"VideoConverted.m4a"];
    
    [BHVideoManager ConvertAudioToVideoWithPath:filePath SaveFileToPath:[NSURL fileURLWithPath:documentsDirectoryPath] TitleFile:@"AudioConverted" CompletionHandler:^{
        NSLog(@"Done");
    }];
}

@end
