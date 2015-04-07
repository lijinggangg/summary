//
//  blockTableViewController.m
//  Demo
//
//  Created by Tony on 14/10/30.
//  Copyright (c) 2014年 Tony. All rights reserved.
//

#import "blockTableViewController.h"
#import "checkBoxCell.h"

NSString *const SIGN = @"flag";

@interface blockTableViewController ()
{
    NSMutableArray    *_flagArray;
}

@end

@implementation blockTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
        if([[[UIDevice currentDevice] systemVersion] floatValue]>= 7.0)
        {
            self.tabView.separatorInset = UIEdgeInsetsZero;
        }
        
        
        
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _flagArray = [NSMutableArray array];
    
    [self structureFlagData:10];
    
    
    if([[[UIDevice currentDevice] systemVersion] floatValue]>= 7.0)
    {
        self.tabView.separatorInset = UIEdgeInsetsZero;
    }


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    NSString *identifier = @"signture";
    
    checkBoxCell *cell  = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(cell == nil)
    {
        cell = [[checkBoxCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    NSMutableDictionary *dic = [_flagArray objectAtIndex:indexPath.row];
    
    NSString *str = [dic objectForKey:SIGN];
    
    if([str isEqualToString:@"YES"])
    {
        [cell setChecked:YES];
    }
    else if([str isEqualToString:@"NO"])
    {
        [cell setChecked:NO];
    }
    

    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    
    return  cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 54;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    [self diffSelectStyle1:indexPath];
}

- (void)diffSelectStyle1:(NSIndexPath *)indexPath
{
    NSMutableDictionary *dic = [_flagArray objectAtIndex: indexPath.row];
    \
    NSString *str = [dic objectForKey:SIGN];
    
    checkBoxCell *cell = (checkBoxCell *)[self.tabView cellForRowAtIndexPath:indexPath];
    
    if([str isEqualToString:@"YES"])
    {
        [dic setObject:@"NO" forKey:SIGN];
        
        [cell setChecked:NO];
    }
    else if([str isEqualToString:@"NO"])
    {
        [dic setObject:@"YES" forKey:SIGN];
        
        [cell setChecked:YES];
    }
}
- (void)diffSelectStyle2:(NSIndexPath *)indexPath
{
    
    [_flagArray enumerateObjectsUsingBlock:^(NSMutableDictionary *dicc, NSUInteger idx, BOOL *stop) {
        
        NSString *str1 = [dicc objectForKey:SIGN];
        
        checkBoxCell *cell =(checkBoxCell *) [self.tabView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:indexPath.section]];
        
        if(idx == indexPath.row)
        {
            if([str1 isEqualToString:@"YES"])
            {
                  [dicc setObject:@"NO" forKey:SIGN];
                [cell setChecked:NO];
            }
            else
            {
                  [dicc setObject:@"YES" forKey:SIGN];
                [cell setChecked:YES];
            }
        }
        else
        {
            [dicc setObject:@"NO" forKey:SIGN];
               [cell setChecked:NO];
        }
        
    }];
   
}



- (void)structureFlagData:(int)num
{
    for(int i = 0; i < num; i++)
    {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:@"NO" forKey:SIGN];
        
        
        [_flagArray addObject:dic];
    }
}
- (void)reloadTableV
{
    [self structureFlagData:10];
    
    
    [self.tabView reloadData];
}


@end
