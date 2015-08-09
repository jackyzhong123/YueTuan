//
//  PeopleFilterViewController.m
//  YueTuan
//
//  Created by Sky on 15/8/8.
//  Copyright (c) 2015年 朋友墙. All rights reserved.
//

#import "PeopleFilterViewController.h"

@interface PeopleFilterViewController ()

@end

@implementation PeopleFilterViewController

- (void)viewDidLoad {
    
    
    
    [self.btnSegSex setSelectedSegmentIndex:[Utilities getFavoriteSex]];
    
    [super viewDidLoad];
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)SegSexChange:(id)sender {
}

- (IBAction)btnConfirmConfig:(id)sender {
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];

    
    [defaults setInteger:[self.btnSegSex selectedSegmentIndex] forKey:@"FavoriteSex"];
    [defaults synchronize];
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshYueYue" object:nil];
        
    }];
    
    
}


@end
