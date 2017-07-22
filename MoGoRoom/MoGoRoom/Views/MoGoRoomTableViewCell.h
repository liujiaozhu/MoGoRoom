//
//  MoGoRoomTableViewCell.h
//  MoGoRoom
//
//  Created by 刘明杰 on 2017/4/16.
//  Copyright © 2017年 刘明杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoGoRoomBusinessProtocol.h"

extern NSString *const kMoGoRoomTableViewCellIdentifier;

@interface MoGoRoomTableViewCell : UITableViewCell

- (void)configWithData:(id<MGBusinessProtocol>)data;

@end
