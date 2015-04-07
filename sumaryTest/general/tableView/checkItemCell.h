//
//  checkItemCell.h
//  Demo
//
//  Created by Tony on 14/10/30.
//  Copyright (c) 2014年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef  void (^itemSelected)(BOOL sta);

@interface checkItemCell : UITableViewCell


@property (nonatomic, retain) UIImageView    *checkbox;

@property (nonatomic, copy) itemSelected   block;

@end
