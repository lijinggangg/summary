//
//  tabCheckItemCell.m
//  Demo
//
//  Created by Tony on 14/10/30.
//  Copyright (c) 2014年 Tony. All rights reserved.
//

#import "tabCheckItemCell.h"

@implementation tabCheckItemCell
{
      
    
      
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self)
    {
        _checkBox = [[UIButton alloc] initWithFrame:CGRectMake(250, 7, 40, 40)];
        [_checkBox setBackgroundImage:[UIImage imageNamed:@"checkbox-unchecked.png"] forState:UIControlStateNormal];
        [_checkBox addTarget:self action:@selector(CheckButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        [self addSubview:_checkBox];
        
        
        _isSelected = NO;
    }
    
    return  self;
}

- (void)CheckButtonTapped:(UIButton *)btn
{
    _isSelected = !_isSelected;
    
    if(_isSelected)
    {
        [_checkBox setBackgroundImage:[UIImage imageNamed:@"checkbox-checked.png"] forState:UIControlStateNormal];
    }
    else
    {
        [_checkBox setBackgroundImage:[UIImage imageNamed:@"checkbox-unchecked.png"] forState:UIControlStateNormal];

    }
    
    self.block(_isSelected);
}




@end












