//
//  SecondViewController.h
//  YueTuan
//
//  Created by Sky on 15/8/6.
//  Copyright (c) 2015年 朋友墙. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TuanGouController : UICollectionViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong,nonatomic) NSArray * maleItems;
@property (strong,nonatomic) NSArray * femaleItems;
@property (strong,nonatomic) NSArray * fooditems;
-(void) downloadMyQinQin;

@end

