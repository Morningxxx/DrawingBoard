//
//  JCGColorButton.h
//  DrawingBoardWithBezierPath
//
//  Created by Morning on 2016/03/14.
//  Copyright © 2016年 Morning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCGView.h"

@protocol JCGColorButtonDelegate <NSObject>

-(void)changeStrokColor:(UIButton*)sender;

@end

@interface JCGColorButton : UIButton

@property (weak, nonatomic) id<JCGColorButtonDelegate> delegate;

@end
