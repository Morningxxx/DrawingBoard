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
//        UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//        UIBarButtonItem* pen = [[UIBarButtonItem alloc] initWithTitle:@"pen" style:UIBarButtonItemStylePlain target:self action:@selector(selectPen:)];
//        UIBarButtonItem* rect = [[UIBarButtonItem alloc] initWithTitle:@"rect" style:UIBarButtonItemStylePlain target:self action:@selector(selectRect)];
//        UIBarButtonItem* circ = [[UIBarButtonItem alloc] initWithTitle:@"orl" style:UIBarButtonItemStylePlain target:self action:@selector(selectCirc)];
//        UIBarButtonItem* style = [[UIBarButtonItem alloc]initWithTitle:@"style" style:UIBarButtonItemStylePlain target:self action:@selector(selectStyle)];
//        [self setItems:@[space,pen,space,rect,space,circ,space,style,space]];
        UITabBarItem* pen = [[UITabBarItem alloc]initWithTitle:@"pen" image:nil tag:1];
        UITabBarItem* rect = [[UITabBarItem alloc]initWithTitle:@"rect" image:nil tag:2];
        UITabBarItem* orcl = [[UITabBarItem alloc]initWithTitle:@"orcl" image:nil tag:2];

        [self setItems:@[pen,rect,orcl]];
    }
    
    return self;
}

//-(void)selectPen:(id)sender{
//    
//}
//
//-(void)selectRect{
//
//}
//
//-(void)selectCirc{
//
//}
//
//-(void)selectStyle{
//
//}

@end
