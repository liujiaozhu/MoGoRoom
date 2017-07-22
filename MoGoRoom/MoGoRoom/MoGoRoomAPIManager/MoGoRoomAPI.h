//
//  MoGoRoomAPI.h
//  MoGoRoom
//
//  Created by 刘明杰 on 2017/4/16.
//  Copyright © 2017年 刘明杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MoGoRoomBaseAPIManagerCallBackDelegate;

@interface MoGoRoomAPI : NSObject

@property (nonatomic, weak) id<MoGoRoomBaseAPIManagerCallBackDelegate> delegate;

- (void)loadData;

@end

@protocol MoGoRoomBaseAPIManagerCallBackDelegate <NSObject>

@required
- (void)managerCallAPIDidSuccess:(MoGoRoomAPI *)manager;

- (void)managerCallAPIDidFailed:(MoGoRoomAPI *)manager;

@end
