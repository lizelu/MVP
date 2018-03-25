//
//  PublicCellItem.h
//  MVVMTest
//
//  Created by lizelu on 2018/3/25.
//  Copyright © 2018年 李泽鲁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PublicModel.h"

@interface PublicCellViewModel : NSObject

@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *weiboId;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSURL *imageUrl;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *text;
@property (assign, nonatomic) CGFloat cellHeight;

- (instancetype)initWithModel:(PublicModel *)model;
@end
