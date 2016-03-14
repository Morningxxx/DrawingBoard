//
//  JCGColorButton.m
//  DrawingBoardWithBezierPath
//
//  Created by Morning on 2016/03/14.
//  Copyright © 2016年 Morning. All rights reserved.
//

#import "JCGColorButton.h"
#import "JCGColorPicker.h"

@implementation JCGColorButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addTarget:self.delegate action:@selector(changeStrokColor:) forControlEvents:UIControlEventTouchUpInside];
    
    }
    
    return self;
}

//-(void)changeStrokColor:(UIButton*)sender{
//    self.drawBoard.strokeColor = sender.backgroundColor;
//}

@end
