//
//  PublicWeiboViewModel.h
//  MVVMTest
//
//  Created by 李泽鲁 on 15/1/8.
//  Copyright (c) 2015年 李泽鲁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PublicCellViewModel.h"
@interface PublicWeiboViewModel : NSObject

@property (copy, nonatomic) ReturnValueBlock returnBlock;
@property (copy, nonatomic) ErrorCodeBlock errorBlock;
@property (copy, nonatomic) FailureBlock failureBlock;


// 传入交互的Block块
- (void)setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailureBlock) failureBlock;
/**
 获取围脖列表
 */
- (void)fetchPublicWeiBo;

@end
