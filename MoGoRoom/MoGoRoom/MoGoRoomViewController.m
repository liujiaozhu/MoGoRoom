//
//  MoGoRoomViewController.m
//  MoGoRoom
//
//  Created by 刘明杰 on 2017/4/16.
//  Copyright © 2017年 刘明杰. All rights reserved.
//

#import "MoGoRoomViewController.h"

#import "MoGoRoomTableViewCell.h"

#import "MoGoRoomBusiness1.h"
#import "MoGoRoomBusiness2.h"
#import "MoGoRoomBusiness3.h"
#import "MoGoRoomBusiness4.h"
#import "MoGoRoomBusiness5.h"

#import <HandyFrame/UIView+LayoutMethods.h>

@interface MoGoRoomViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *businessSourceList;

@end

@implementation MoGoRoomViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];

    __weak typeof(self) weakSelf = self;
    completionHandler completion = ^ (NSUInteger idx){
        [weakSelf.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:idx inSection:0], nil] withRowAnimation:UITableViewRowAnimationAutomatic];
    };

    [self.businessSourceList makeObjectsPerformSelector:@selector(setCompletionHandler:) withObject:completion];
    //这里的business 其实可以用继承，如果用继承，每个business里面一坨相似或者重复的代码可以挪到基类里面去，但是我并没有这么去做，一是个人原因：我不喜欢用继承，二：现在Demo中的假需求是这样的，但是现实业务场景中，每个business可能都不一样，如果用基类，那基类实现文件里面只留一些空函数，由子类去重载，那我还不如用protocol呢。
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

    [self.tableView fill];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200.f;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.businessSourceList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MoGoRoomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMoGoRoomTableViewCellIdentifier forIndexPath:indexPath];

    id <MGBusinessProtocol>business = self.businessSourceList[indexPath.row];
    //这个method放在此处调用，因为如果有十几个业务，而一个tableview可能第一次只显示了3个业务数据，那不能一下子把十几个业务数据全部去请求过来。
    [business execute];

    [cell configWithData:business];
    return cell;
}

#pragma mark - setter and getter

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];

        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

        [_tableView registerClass:[MoGoRoomTableViewCell class] forCellReuseIdentifier:kMoGoRoomTableViewCellIdentifier];
    }
    return _tableView;
}

- (NSMutableArray *)businessSourceList
{
    if (_businessSourceList == nil) {
        _businessSourceList = [NSMutableArray new];
        [_businessSourceList addObject:[[MoGoRoomBusiness1 alloc] init]];
        [_businessSourceList addObject:[[MoGoRoomBusiness2 alloc] init]];
        [_businessSourceList addObject:[[MoGoRoomBusiness3 alloc] init]];
        [_businessSourceList addObject:[[MoGoRoomBusiness4 alloc] init]];
        [_businessSourceList addObject:[[MoGoRoomBusiness5 alloc] init]];
        /**
         未来你可以继续加6，7，8，9
         */
    }
    return _businessSourceList;
}

@end
