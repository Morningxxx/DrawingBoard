//
//  JCGColorPicker.m
//  DrawingBoardWithBezierPath
//
//  Created by Morning on 2016/03/14.
//  Copyright © 2016年 Morning. All rights reserved.
//

#import "JCGColorPicker.h"
#import "JCGColorButton.h"

@interface JCGColorPicker () <JCGColorButtonDelegate>

@end


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
        frame.size = CGSizeMake(240, 20);
        frame.origin.x = [UIScreen mainScreen].bounds.size.width - 270;
        self.frame = frame;
        NSArray* colorArr = @[[UIColor redColor],[UIColor orangeColor],[UIColor yellowColor],[UIColor greenColor],[UIColor blueColor],[UIColor blackColor],[UIColor grayColor],[UIColor whiteColor]];
        
        for (int i = 0; i < colorArr.count; ++i) {
            CGRect btnFrame;
            btnFrame.origin.x = 30 * i;
            btnFrame.origin.y = 0;
            btnFrame.size = CGSizeMake(30,20);
            JCGColorButton* colorBtn = [[JCGColorButton alloc] initWithFrame:btnFrame];
            colorBtn.backgroundColor = colorArr[i];
            colorBtn.delegate = self;
            [self addSubview:colorBtn];
        }

    }
    return self;
}

//-(void)setDrawBoard:(JCGView *)drawBoard{
//    _drawBoard = drawBoard;
//    
//    
//    NSArray* colorArr = @[[UIColor redColor],[UIColor orangeColor],[UIColor yellowColor],[UIColor greenColor],[UIColor blueColor],[UIColor blackColor],[UIColor grayColor],[UIColor whiteColor]];
//    
//    for (int i = 0; i < colorArr.count; ++i) {
//        CGRect btnFrame;
//        btnFrame.origin.x = 40 * i;
//        btnFrame.origin.y = 0;
//        btnFrame.size = CGSizeMake(40,30);
//        JCGColorButton* colorBtn = [[JCGColorButton alloc] initWithFrame:btnFrame];
//        colorBtn.backgroundColor = colorArr[i];
//        colorBtn.drawBoard = _drawBoard;
//        [self addSubview:colorBtn];
//    }
//}

#pragma mark - JCGColorButtonDelegate
-(void)changeStrokColor:(UIButton *)sender{
    self.drawBoard.strokeColor = sender.backgroundColor;
    self.curColorBtn.backgroundColor = sender.backgroundColor;
    [UIView animateWithDuration:0.5 animations:^{
        self.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
    }completion:^(BOOL finished) {
        self.hidden = YES;
    }];
    
}

@end
