
//
//  MoGoRoomBusinessProtocol.h
//  MoGoRoom
//
//  Created by 刘明杰 on 2017/4/16.
//  Copyright © 2017年 刘明杰. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,MGBusinessState){
    MGBusinessStateIdle,
    MGBusinessStateLoading,
    MGBusinessStateSuccess,
    MGBusinessStateFailed,
};

typedef void (^completionHandler)(NSUInteger idx);

@protocol MGBusinessProtocol <NSObject>

- (void)execute;

- (void)setCompletionHandler:(completionHandler)completionHandler;

@property (nonatomic, assign, readonly) MGBusinessState state;

@end
