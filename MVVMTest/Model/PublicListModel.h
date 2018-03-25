//
//  PublicListModel.h
//  MVVMTest
//
//  Created by lizelu on 2018/3/25.
//  Copyright © 2018年 李泽鲁. All rights reserved.
//

#import "SuperModelClass.h"
#import "PublicModel.h"

@interface PublicListModel : SuperModelClass

@property (nonatomic, copy) NSArray<PublicModel *> * publicList;

- (void)fetchPublicWeiBo;

@end
