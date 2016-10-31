//
//  HZYSpeach.h
//  speachEx
//
//  Created by Michael-Nine on 2016/10/1.
//  Copyright © 2016年 Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZYSpeach : NSObject
- (void)speak:(NSString *)speechString;
- (void)pause;
- (void)replay;
- (void)stop;
@end
