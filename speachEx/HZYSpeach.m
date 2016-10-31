//
//  HZYSpeach.m
//  speachEx
//
//  Created by Michael-Nine on 2016/10/1.
//  Copyright © 2016年 Michael. All rights reserved.
//

#import "HZYSpeach.h"
#import <AVFoundation/AVFoundation.h>

@interface HZYSpeach ()
@property (strong, nonatomic) AVSpeechSynthesizer *sy;
@property (strong, nonatomic) AVSpeechUtterance *su;

@end
@implementation HZYSpeach
- (instancetype)init{
    if (self = [super init]) {
        AVAudioSession *session = [AVAudioSession sharedInstance];
        NSError *error;
        if (![session setCategory:AVAudioSessionCategoryAmbient error:&error]) {
            NSLog(@"set category error: %@", error);
        }
        if (![session setActive:YES error:&error]) {
            NSLog(@"set active error: %@", error);
        }
        self.sy = [AVSpeechSynthesizer new];
    }
    return self;
}

- (void)speak:(NSString *)speechString{
    self.su = [[AVSpeechUtterance alloc]initWithString:speechString];
    self.su.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    self.su.rate = 0.5;
    self.su.pitchMultiplier = 0.8;
    [_sy speakUtterance:_su];
}

- (void)pause{
    [_sy pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}

- (void)replay{
    [_sy continueSpeaking];
}

- (void)stop{
    [_sy stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}
@end
