//
//  JCGColorPicker.h
//  DrawingBoardWithBezierPath
//
//  Created by Morning on 2016/03/14.
//  Copyright © 2016年 Morning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCGView.h"

@interface JCGColorPicker : UIView 

@property (weak, nonatomic) JCGView* drawBoard;
@property (strong, nonatomic) UIColor* curColor;
@property (weak, nonatomic) UIButton* curColorBtn;

@end
