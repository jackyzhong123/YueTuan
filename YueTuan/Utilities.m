//
//  Utilities.m
//  YueTuan
//
//  Created by Sky on 15/8/8.
//  Copyright (c) 2015年 朋友墙. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities


+(NSString *)urlDecode:(NSString*)str
{
    
    
    str = [str stringByReplacingOccurrencesOfString:@"=" withString:@"%3D"];
    str = [str stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    str = [str stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    str = [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    
    return str;
    
    
}


+(NSString *)getUniqueStrByUUID
{
    CFUUIDRef    uuidObj = CFUUIDCreate(nil);//create a new UUID
    
    //get the string representation of the UUID
    
    NSString    *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(nil, uuidObj);
    
    CFRelease(uuidObj);
    return uuidString;
}

+(NSString *)getServerHost
{
    return  @"jackyzhong.chinacloudsites.cn";
}

+(NSInteger) getFavoriteSex
{
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    if ([defaults integerForKey:@"FavoriteSex"]) {
        return  [defaults integerForKey:@"FavoriteSex"];
    }
    return 0;
        //[defaults setObject:@"1" forKey:@"JumpDebug"];

}




@end
