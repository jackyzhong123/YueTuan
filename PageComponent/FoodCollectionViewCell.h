//
//  FoodCollectionViewCell.h
//  YueTuan
//
//  Created by Sky on 15/8/8.
//  Copyright (c) 2015年 朋友墙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodCollectionViewCell : UICollectionViewCell
@property (strong,nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) IBOutlet UILabel *lblName;
@property (strong,nonatomic) IBOutlet UILabel *lblPrice;
@property (strong,nonatomic) IBOutlet UILabel *lblLocation;
@end
