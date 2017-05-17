//
//  PublicTableViewController.m
//  MVVMTest
//
//  Created by 李泽鲁 on 15/1/8.
//  Copyright (c) 2015年 李泽鲁. All rights reserved.
//

#import "PublicTableViewController.h"
#import "PublicWeiboViewModel.h"
#import "PublicCell.h"

@interface PublicTableViewController ()
@property (strong, nonatomic) NSArray *publicModelArray;
@end

@implementation PublicTableViewController
#pragma mark - lift cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViewModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - config

/**
 创建ViewModel
 */
- (void)createViewModel {
    PublicWeiboViewModel *publicViewModel = [[PublicWeiboViewModel alloc] init];
    [publicViewModel setBlockWithReturnBlock:^(id returnValue) {
        [SVProgressHUD dismiss];
        _publicModelArray = returnValue;
        [self.tableView reloadData];
        DDLog(@"%@",_publicModelArray);
        
    } WithErrorBlock:^(id errorCode) {
        [SVProgressHUD dismiss];
    } WithFailureBlock:^{
        [SVProgressHUD dismiss];
    }];
    
    [publicViewModel fetchPublicWeiBo];
    [SVProgressHUD showWithStatus:@"正在获取用户信息……" maskType:SVProgressHUDMaskTypeBlack];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _publicModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PublicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PublicCell" forIndexPath:indexPath];
    [cell setValueWithDic:_publicModelArray[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    PublicModel *model = (PublicModel *)_publicModelArray[indexPath.row];
    return model.cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PublicWeiboViewModel *publicViewModel = [[PublicWeiboViewModel alloc] init];
    [publicViewModel weiboDetailWithPublicModel:_publicModelArray[indexPath.row] WithViewController:self];
}


@end
