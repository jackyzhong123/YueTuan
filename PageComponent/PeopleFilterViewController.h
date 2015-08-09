//
//  PeopleFilterViewController.h
//  YueTuan
//
//  Created by Sky on 15/8/8.
//  Copyright (c) 2015年 朋友墙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleFilterViewController : UIViewController
- (IBAction)btnBack:(id)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *btnSegSex;
- (IBAction)SegSexChange:(id)sender;
- (IBAction)btnConfirmConfig:(id)sender;


@end
