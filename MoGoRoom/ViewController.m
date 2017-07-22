//
//  ViewController.m
//  MoGoRoom
//
//  Created by 刘明杰 on 2017/4/16.
//  Copyright © 2017年 刘明杰. All rights reserved.
//

#import "ViewController.h"
#import "MoGoRoomViewController.h"

#import <HandyFrame/UIView+LayoutMethods.h>

NSString * const kDataSourceParamsTitle = @"kDataSourceParamsTitle";
NSString * const kDataSourceParamsViewController = @"kDataSourceParamsViewController";
NSString * const kViewControllerTableViewCellIdentifier = @"kViewControllerTableViewCellIdentifier";

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

    [self.tableView fill];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kViewControllerTableViewCellIdentifier];
    cell.textLabel.text = self.dataSource[indexPath.row][kDataSourceParamsTitle];
    cell.contentView.backgroundColor = [UIColor orangeColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];

    Class viewControllerClass = self.dataSource[indexPath.row][kDataSourceParamsViewController];
    UIViewController *viewController = [[viewControllerClass alloc] init];

    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - setter and getter

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;

        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kViewControllerTableViewCellIdentifier];
    }
    return _tableView;
}

- (NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = @[
                        @{
                            kDataSourceParamsTitle:@"蘑菇租房",
                            kDataSourceParamsViewController:[MoGoRoomViewController class]
                            }
                        ];
    }
    
    return _dataSource;
}
@end
