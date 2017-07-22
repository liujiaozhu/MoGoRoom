//
//  MoGoRoomBusiness4.m
//  MoGoRoom
//
//  Created by 刘明杰 on 2017/4/16.
//  Copyright © 2017年 刘明杰. All rights reserved.
//

#import "MoGoRoomBusiness4.h"
#import "MoGoRoomAPI.h"

@interface MoGoRoomBusiness4 ()<MoGoRoomBaseAPIManagerCallBackDelegate,MGBusinessProtocol>

@property (nonatomic, strong) MoGoRoomAPI *request;
@property (nonatomic, copy) completionHandler completionHandler;
@property (nonatomic, assign) MGBusinessState state;

@end

@implementation MoGoRoomBusiness4

#pragma mark - life cycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        _state = MGBusinessStateIdle;
    }
    return self;
}

#pragma mark - MGBusinessProtocol

- (void)execute
{
    if(_state != MGBusinessStateIdle) return;
    _state = MGBusinessStateLoading;
    [self.request loadData];
}

- (void)setCompletionHandler:(completionHandler)completionHandler
{
    _completionHandler = completionHandler;
}

#pragma mark - MoGoRoomBaseAPIManagerCallBackDelegate

- (void)managerCallAPIDidSuccess:(MoGoRoomAPI *)manager
{
    _state = MGBusinessStateSuccess;
    self.completionHandler ? self.completionHandler(3) : nil;
}

- (void)managerCallAPIDidFailed:(MoGoRoomAPI *)manager
{
    _state = MGBusinessStateFailed;
    self.completionHandler ? self.completionHandler(3) : nil;
}

#pragma mark - setter and getter

- (MoGoRoomAPI *)request
{
    if (_request == nil) {
        _request = [[MoGoRoomAPI alloc] init];

        _request.delegate = self;
    }
    return _request;
}@end
