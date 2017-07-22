//
//  MoGoRoomAPI.m
//  MoGoRoom
//
//  Created by 刘明杰 on 2017/4/16.
//  Copyright © 2017年 刘明杰. All rights reserved.
//

#import "MoGoRoomAPI.h"

@interface MoGoRoomAPI  ()

@end

@implementation MoGoRoomAPI

#pragma mark - life cycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        _delegate = nil;
    }
    return self;
}

#pragma mark - calling api

- (void)loadData
{
    NSInteger randomValue = arc4random() % 2;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (randomValue) {
            [self.delegate managerCallAPIDidSuccess:self];
        }else{
            [self.delegate managerCallAPIDidFailed:self];
        }
    });
}

@end
