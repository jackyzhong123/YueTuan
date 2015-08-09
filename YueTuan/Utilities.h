//
//  Utilities.h
//  YueTuan
//
//  Created by Sky on 15/8/8.
//  Copyright (c) 2015年 朋友墙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utilities : NSObject
+(NSString *)getUniqueStrByUUID;

+(NSString *)getServerHost;

+(NSString *)urlDecode:(NSString*)str;
+(NSInteger) getFavoriteSex;

@end
