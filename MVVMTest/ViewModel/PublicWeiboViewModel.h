//
//  PublicWeiboViewModel.h
//  MVVMTest
//
//  Created by 李泽鲁 on 15/1/8.
//  Copyright (c) 2015年 李泽鲁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PublicCellViewModel.h"
typedef NS_ENUM (NSInteger, WeboRequsetType) {
    ListRequest,
    Other
};
typedef void (^ReturnValueBlockType) (id returnValue, WeboRequsetType);
@interface PublicWeiboViewModel : NSObject

@property (copy, nonatomic) ReturnValueBlockType returnBlock;
@property (copy, nonatomic) ErrorCodeBlock errorBlock;
@property (copy, nonatomic) FailureBlock failureBlock;


// 传入交互的Block块
- (void)setBlockWithReturnBlock: (ReturnValueBlockType) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailureBlock) failureBlock;
/**
 获取围脖列表
 */
- (void)fetchPublicWeiBo;

@end
