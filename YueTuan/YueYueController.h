//
//  FirstViewController.h
//  YueTuan
//
//  Created by Sky on 15/8/6.
//  Copyright (c) 2015年 朋友墙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YueYueController : UICollectionViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentId;
@property BOOL isFemale;
@property (strong,nonatomic) NSArray * maleItems;
@property (strong,nonatomic) NSArray * femaleItems;
@property (strong,nonatomic) NSArray * fooditems;
-(void) downloadMyQinQin;

- (IBAction)btnPeopleFilter:(id)sender;
- (IBAction)btnFilter:(id)sender;


@end

