//
//  blockTableViewController.h
//  Demo
//
//  Created by Tony on 14/10/30.
//  Copyright (c) 2014年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface blockTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, retain) IBOutlet    UITableView    *tabView;


@end
