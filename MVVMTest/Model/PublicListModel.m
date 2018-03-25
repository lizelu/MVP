//
//  PublicListModel.m
//  MVVMTest
//
//  Created by lizelu on 2018/3/25.
//  Copyright © 2018年 李泽鲁. All rights reserved.
//

#import "PublicListModel.h"

@implementation PublicListModel
/**
 获取公共微博
 */
- (void)fetchPublicWeiBo {
    NSDictionary *parameter = @{COUNT: @"100"};
    [NetRequestClass NetRequestGETWithRequestURL:REQUESTPUBLICURL WithParameter:parameter WithReturnValeuBlock:^(id returnValue) {
        DDLog(@"%@", returnValue);
        [self fetchValueSuccessWithDic:returnValue];
        
    } WithFailureBlock:^{
        [self netFailure];
        DDLog(@"网络异常");
        
    }];
}

/**
 获取到正确的数据，对正确的数据进行处理
 
 @param returnValue 返回成功后的值
 */
-(void)fetchValueSuccessWithDic: (NSDictionary *) returnValue {
    //对从后台获取的数据进行处理，然后传给ViewController层进行显示
    
    NSArray *statuses = returnValue[STATUSES];
    NSMutableArray *publicModelArray = [[NSMutableArray alloc] initWithCapacity:statuses.count];
    
    for (int i = 0; i < statuses.count; i ++) {
        PublicModel *publicModel = [[PublicModel alloc] init];
        publicModel.date = statuses[i][CREATETIME];
        publicModel.userName = statuses[i][USER][USERNAME];
        publicModel.text = statuses[i][WEIBOTEXT];
        publicModel.imageUrl = [NSURL URLWithString:statuses[i][USER][HEADIMAGEURL]];
        publicModel.userId = statuses[i][USER][UID];
        publicModel.weiboId = statuses[i][WEIBOID];
        [publicModelArray addObject:publicModel];
    }
    self.publicList = publicModelArray;
    self.returnBlock(self);
}

/**
 对ErrorCode进行处理
 
 @param errorDic
 */
-(void) errorCodeWithDic: (NSDictionary *) errorDic {
    self.errorBlock(errorDic);
}

/**
 对网路异常进行处理
 */
-(void) netFailure {
    self.failureBlock();
}

- (void)dealloc
{
    DDLog(@"PublicListModel - 释放");
}

@end
