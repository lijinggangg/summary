//
//  checkItemCell.m
//  Demo
//
//  Created by Tony on 14/10/30.
//  Copyright (c) 2014年 Tony. All rights reserved.
//

#import "checkItemCell.h"

@implementation checkItemCell
{
    BOOL _isSelected;
    
    
    
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self)
    {
        self.checkbox = [[UIImageView alloc] initWithFrame:CGRectMake(250, 7, 40, 40)];
        [_checkbox setImage:[UIImage imageNamed:@"checkbox-unchecked.png"]];
        [self addSubview:_checkbox];
        
        _isSelected = NO;
    }
    
    return  self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
// animate between regular and selected state
{
    
    [super setSelected:selected animated:animated];
    
    
    
    if(_isSelected)
    {
        [_checkbox setImage:[UIImage imageNamed:@"checkbox-checked.png"]];

    }
    else
    {
        [_checkbox setImage:[UIImage imageNamed:@"checkbox-unchecked.png"]];

    }
    
    _isSelected = !_isSelected;

    
  //  self.block(_isSelected);

  }

//- (void)setSelected:(BOOL)selected
//{
//    if(selected)
//    {
//        [_checkbox setImage:[UIImage imageNamed:@"checkbox-checked.png"]];
//    }
//    else
//    {
//        [_checkbox setImage:[UIImage imageNamed:@"checkbox-unchecked.png"]];
//        
//    }
//    //_isSelected = !_isSelected;
//    
//    self.block(selected);
//
//}
@end
