//
//  MoGoRoomTableViewCell.m
//  MoGoRoom
//
//  Created by 刘明杰 on 2017/4/16.
//  Copyright © 2017年 刘明杰. All rights reserved.
//

#import "MoGoRoomTableViewCell.h"
#import "UIColor+Random.h"

#import <HandyFrame/UIView+LayoutMethods.h>

NSString *const kMoGoRoomTableViewCellIdentifier = @"kMoGoRoomTableViewCellIdentifier";

@interface MoGoRoomTableViewCell ()

@property (nonatomic, strong) UILabel *stateLabel;

@end

@implementation MoGoRoomTableViewCell

#pragma mark - life cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor randomColor];
        [self.contentView addSubview:self.stateLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.stateLabel sizeToFit];
    [self.stateLabel centerEqualToView:self];
}

#pragma mark - public method

- (void)configWithData:(id<MGBusinessProtocol>)data
{
    NSString *content;

    //以下业务可以放到business中去。business直接给出一个value
    if ([data state] == MGBusinessStateIdle) {
        content = @"正在闲置";
    }else if ([data state] == MGBusinessStateLoading){
        content = @"加载中";
    }else if ([data state] == MGBusinessStateSuccess){
        content = @"请求成功";
    }else if ([data state] == MGBusinessStateFailed){
        content = @"请求失败";
    }
    self.stateLabel.text = content;
}

#pragma mark - setter and getter

- (UILabel *)stateLabel
{
    if (_stateLabel == nil) {
        _stateLabel = [[UILabel alloc] init];
        _stateLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _stateLabel;
}

@end
