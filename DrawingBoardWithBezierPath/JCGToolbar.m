//
//  JCGToolbar.m
//  DrawingBoardWithBezierPath
//
//  Created by Morning on 2016/03/12.
//  Copyright © 2016年 Morning. All rights reserved.
//

#import "JCGToolbar.h"

@implementation JCGToolbar


/**use this method to init!*/
- (instancetype)init{
    
    if (self = [super init]){
        CGRect frame;
        frame.origin = CGPointMake(0, [UIScreen mainScreen].bounds.size.height - 50);
        frame.size =  CGSizeMake([UIScreen mainScreen].bounds.size.width, 50);
        self.frame = frame;
        
        UITabBarItem* pen = [[UITabBarItem alloc]initWithTitle:@"Pen" image:nil tag:1];
        UITabBarItem* rect = [[UITabBarItem alloc]initWithTitle:@"Rect" image:nil tag:2];
        UITabBarItem* orcl = [[UITabBarItem alloc]initWithTitle:@"Oval" image:nil tag:3];
        UITabBarItem* line = [[UITabBarItem alloc]initWithTitle:@"Line" image:nil tag:4];

        [self setItems:@[pen,rect,orcl,line]];
    }
    
    return self;
}



@end
