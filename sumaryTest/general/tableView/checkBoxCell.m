//
//  checkBoxCell.m
//  Demo
//
//  Created by Tony on 14/10/30.
//  Copyright (c) 2014年 Tony. All rights reserved.
//

#import "checkBoxCell.h"

@interface checkBoxCell ()
{
    UIImageView    *_checkBox;
    
}


@end

@implementation checkBoxCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self)
    {
        _checkBox = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"checkbox-unchecked.png"]];
        [_checkBox setFrame:CGRectMake(250, 7, 40, 40)];
        [self addSubview:_checkBox];
        
    }
    return self;
}

- (void)setChecked:(BOOL)sta
{
    if(sta)
    {
        [_checkBox setImage:[UIImage imageNamed:@"checkbox-checked.png"]];
    }
    else
    {
        [_checkBox setImage:[UIImage imageNamed:@"checkbox-unchecked.png"]];
    }
    

}




@end
