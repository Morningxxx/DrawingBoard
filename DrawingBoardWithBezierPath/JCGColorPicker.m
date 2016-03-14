//
//  JCGColorPicker.m
//  DrawingBoardWithBezierPath
//
//  Created by Morning on 2016/03/14.
//  Copyright © 2016年 Morning. All rights reserved.
//

#import "JCGColorPicker.h"
#import "JCGColorButton.h"




@implementation JCGColorPicker

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        CGRect frame = self.frame;
        frame.size = CGSizeMake(320, 30);
        frame.origin.x = [UIScreen mainScreen].bounds.size.width - 320;
        self.frame = frame;

    }
    return self;
}

-(void)setDrawBoard:(JCGView *)drawBoard{
    _drawBoard = drawBoard;
    
    
    NSArray* colorArr = @[[UIColor redColor],[UIColor orangeColor],[UIColor yellowColor],[UIColor greenColor],[UIColor blueColor],[UIColor blackColor],[UIColor grayColor],[UIColor whiteColor]];
    
    for (int i = 0; i < colorArr.count; ++i) {
        CGRect btnFrame;
        btnFrame.origin.x = 40 * i;
        btnFrame.origin.y = 0;
        btnFrame.size = CGSizeMake(40,30);
        JCGColorButton* colorBtn = [[JCGColorButton alloc] initWithFrame:btnFrame];
        colorBtn.backgroundColor = colorArr[i];
        colorBtn.drawBoard = _drawBoard;
        [self addSubview:colorBtn];
    }
}



@end
