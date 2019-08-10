//
//  BHVideoManager.h
//  BHVideoManager
//
//  Created by BandarHelal on 10/08/2019.
//

#import <UIKit/UIKit.h>
#import <CoreMedia/CoreMedia.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface BHVideoManager : NSObject
+ (void)TrimVideoWithPath:(NSURL *)filepath StartTime:(CMTime)sTime EndTime:(CMTime)eTime SaveFileToPath:(NSURL *)savepath TitleFile:(NSString *)title CompletionHandler:(void (^)(void))handler;
+ (void)TrimAudioWithPath:(NSURL *)filepath StartTime:(CMTime)sTime EndTime:(CMTime)eTime SaveFileToPath:(NSURL *)savepath TitleFile:(NSString *)title CompletionHandler:(void (^)(void))handler;
+ (void)MergeVideo:(NSURL *)vURL WithAudio:(NSURL *)aURL SaveFileToPath:(NSURL *)savepath TitleFile:(NSString *)title CompletionHandler:(void (^)(void))handler;
+ (void)ConvertVideoToAudioWithPath:(NSURL *)filePath SaveFileToPath:(NSURL *)savepath TitleFile:(NSString *)title CompletionHandler:(void (^)(void))handler;
+ (void)ConvertAudioToVideoWithPath:(NSURL *)filePath SaveFileToPath:(NSURL *)savepath TitleFile:(NSString *)title CompletionHandler:(void (^)(void))handler;
@end
