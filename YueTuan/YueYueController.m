//
//  FirstViewController.m
//  YueTuan
//
//  Created by Sky on 15/8/6.
//  Copyright (c) 2015年 朋友墙. All rights reserved.
//

#import "YueYueController.h"
#import "PeopleCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@interface YueYueController ()

@end

@implementation YueYueController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.femaleItems=[NSArray new];
    self.maleItems=[NSArray new];
    self.fooditems=[NSArray new];
    self.isFemale=NO;
    [self downloadMyQinQin];
    
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    
    
    //============添加observer
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doUpdate:) name:@"refreshYueYue" object:nil];
    
    
}

-(void) doUpdate:(NSNotification*) notification{
    //[self performSelectorOnMainThread:@selector(updateUI)withObject:updateData waitUntilDone:YES];
    [self.collectionView reloadData];
}


-(void) downloadMyQinQin
{
    MKNetworkEngine *engin=[[MKNetworkEngine alloc] init];
    MKNetworkOperation *op=[engin operationWithURLString:[NSString stringWithFormat:@"http://%@/Handler/getMyQinQin/%i",[Utilities getServerHost],rand()]] ;
    
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        //////=====
        NSString *jsonStr = [completedOperation responseString];
        NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dic;
        NSArray* maleResult;
        NSArray* femaleResult;
        NSArray* foodResult;
        @try {
            dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
            
            maleResult =[dic objectForKey:@"male"];
            foodResult=[dic objectForKey:@"food"];
            femaleResult=[dic objectForKey:@"female"];
        }
        @catch (NSException *exception) {
            return ;
        }
        @finally {
            
        }
        
        
        if(!maleResult)
            return ;
        //-------------- begin -----------
        
        
        //        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        //        [defaults setObject:arrayResult forKey:@"myHabbit"];
        //        [defaults synchronize];
        self.maleItems=maleResult;
        self.femaleItems=femaleResult;
        self.fooditems=foodResult;
        [self.collectionView reloadData];
        
        //////====
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"donwnload file error");
    }];
    
    [engin enqueueOperation:op];
}

- (IBAction)btnPeopleFilter:(id)sender {
    
    
}

- (IBAction)btnFilter:(id)sender {
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];

    
    
    if (YES)
    {
        if ([defaults integerForKey:@"FavoriteSex"]==1) {
            return  [self.femaleItems count];
        }else
        {
            return  [self.maleItems count];
        }
        
    }else
    {
        return  [self.fooditems count];
    }
    
    
    
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PeopleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    
    
    NSString *event;
    
    
    if (YES)
    {
        
        
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        
        
       
            if ([defaults integerForKey:@"FavoriteSex"]==1) {

            event= [self.femaleItems  objectAtIndex:(indexPath.section*3 + indexPath.row)];
        }else
        {
            event= [self.maleItems  objectAtIndex:(indexPath.section*3 + indexPath.row)];
        }
        
        
        
    }else
    {
        event= [self.fooditems  objectAtIndex:(indexPath.section*3 + indexPath.row)];
    }
    
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:event]
                      placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    cell.imageView.contentMode=UIViewContentModeScaleAspectFill;
    
    return cell;
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
