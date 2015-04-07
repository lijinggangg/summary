//
//  TextViewTableViewCell.h
//  Demo
//
//  Created by Tony on 14/12/26.
//  Copyright (c) 2014年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewTableViewCell : UITableViewCell<UITextViewDelegate>



@property (nonatomic, retain) IBOutlet    UITextView    *textView;



@end
