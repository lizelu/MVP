//
//  PublicWeiboViewModel.m
//  MVVMTest
//
//  Created by 李泽鲁 on 15/1/8.
//  Copyright (c) 2015年 李泽鲁. All rights reserved.
//

#import "PublicWeiboViewModel.h"
#import "PublicListModel.h"

@implementation PublicWeiboViewModel

#pragma 接收传过来的block
- (void)setBlockWithReturnBlock: (ReturnValueBlockType) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailureBlock) failureBlock
{
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
}

/**
 获取公共微博
 */
- (void)fetchPublicWeiBo {
    PublicListModel *model = [PublicListModel new];
    [model setBlockWithReturnBlock:^(id returnValue) {
        [self fetchValueSuccessWithDic:returnValue];
    } WithErrorBlock:^(id errorCode) {
        [self errorCodeWithDic:errorCode];
    } WithFailureBlock:^{
        [self netFailure];
    }];
    [model fetchPublicWeiBo];
}
;
/**
 获取到正确的数据，对正确的数据进行处理

 @param returnValue 返回成功后的值
 */
-(void)fetchValueSuccessWithDic: (PublicListModel *) publicListModel {
    //对从后台获取的数据进行处理，然后传给ViewController层进行显示
    
    NSArray *publicModelArray = publicListModel.publicList;
    NSMutableArray *cellViewModels = [[NSMutableArray alloc] initWithCapacity:publicModelArray.count];
    for (int i = 0; i < publicModelArray.count; i ++) {
        PublicCellViewModel *cellViewModel = [[PublicCellViewModel alloc] initWithModel:publicModelArray[i]];
        [cellViewModels addObject:cellViewModel];
    }
    self.returnBlock(cellViewModels, ListRequest);
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
    DDLog(@"PublicWeiboViewModel - 释放");
}

@end
