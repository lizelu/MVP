//
//  PublicCell.m
//  MVVMTest
//
//  Created by 李泽鲁 on 15/1/8.
//  Copyright (c) 2015年 李泽鲁. All rights reserved.
//

#import "PublicCell.h"

@interface PublicCell ()

@property (strong, nonatomic) IBOutlet UILabel *userName;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UIImageView *headImageView;
@property (strong, nonatomic) IBOutlet UITextView *weiboText;

@end

@implementation PublicCell

- (void)bindCellViewModel:(PublicCellViewModel *) cellViewModel; {
    _userName.text = cellViewModel.userName;
    _date.text = cellViewModel.date;
    _weiboText.text = cellViewModel.text;
    [_headImageView sd_setImageWithURL:cellViewModel.imageUrl];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
