//
//  tabCheckItemCell.h
//  Demo
//
//  Created by Tony on 14/10/30.
//  Copyright (c) 2014年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^tabCheckItemCellTapped) (BOOL selected);

@interface tabCheckItemCell : UITableViewCell


@property (nonatomic, copy)tabCheckItemCellTapped    block;

@property (nonatomic, assign)   BOOL            isSelected;

@property (nonatomic, retain)     UIButton        *checkBox;

@end
