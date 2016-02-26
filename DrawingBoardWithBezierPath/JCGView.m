//
//  JCGView.m
//  15th-assignment-QZ2d
//
//  Created by Morning on 2016/02/23.
//  Copyright © 2016年 Morning. All rights reserved.
//

#import "JCGView.h"

@interface JCGView()

@property (nonatomic, strong) NSMutableArray<NSDictionary*>* pointAll;
@property (nonatomic, strong) NSMutableArray* pointCur;
@property (weak,nonatomic) UISegmentedControl* penEraserChose;
@property (strong,nonatomic) UIColor* fillColor;
@property (assign,nonatomic) CGFloat penWidth;
@property (assign,nonatomic) CGFloat eraserWidth;

@end

@implementation JCGView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        UIButton* clearBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        clearBtn.frame = CGRectMake(20, 30, 60, 20);
        [clearBtn setTitle:@"Clear" forState:UIControlStateNormal];
        [clearBtn addTarget:self action:@selector(clearBoard) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:clearBtn];
        UISegmentedControl* panErazerChose = [[UISegmentedControl alloc]initWithFrame:CGRectMake(self.bounds.size.width/2-50, 30, 100, 20)];
        self.penEraserChose= panErazerChose;
        [panErazerChose insertSegmentWithTitle:@"pan" atIndex:0 animated:NO];
        [panErazerChose insertSegmentWithTitle:@"eraser" atIndex:1 animated:NO];
        panErazerChose.selectedSegmentIndex = 0;
        [self addSubview:panErazerChose];
        self.fillColor = [UIColor blackColor];
        self.penWidth = 3;
        self.eraserWidth = 10;
    }
    return self;
}

-(NSMutableArray*)pointAll{
    if (!_pointAll)
        _pointAll = [NSMutableArray array];
    return _pointAll;
}

-(NSMutableArray *)pointCur{
    if (!_pointCur) {
        _pointCur = [NSMutableArray array];
    }
    return _pointCur;
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.pointCur = nil;
    self.penEraserChose.userInteractionEnabled = NO;
    [self.pointCur addObject:[NSValue valueWithCGPoint:[[touches anyObject] locationInView:self]]];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.pointCur addObject:[NSValue valueWithCGPoint:[[touches anyObject] locationInView:self]]];
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.pointCur addObject:[NSValue valueWithCGPoint:[[touches anyObject] locationInView:self]]];
    
    NSDictionary* path = @{_penEraserChose.selectedSegmentIndex ? @"eraser":@"pen" : self.pointCur};
    [self.pointAll addObject:path];
    self.penEraserChose.userInteractionEnabled = YES;

}

-(void)clearBoard{
    self.pointCur = nil;
    self.pointAll = nil;
    [self setNeedsDisplay];
}


-(void)drawRect:(CGRect)rect{
    if (_pointAll) {
        for (NSDictionary* pointDic in _pointAll) {
            UIBezierPath* path = [[UIBezierPath alloc]init];
            NSArray* pointArr = pointDic[@"pen"];
            [self.fillColor setStroke];
            [path moveToPoint:[pointArr.firstObject CGPointValue]];
            for (NSValue* point in pointArr) {
                CGPoint p = [point CGPointValue];
                [path addLineToPoint:p];
            }
            [path setLineWidth:self.penWidth];
            [path stroke];
            UIBezierPath* path1 = [[UIBezierPath alloc]init];
            pointArr = pointDic[@"eraser"];
            [self.backgroundColor setStroke];
            [path1 moveToPoint:[pointArr.firstObject CGPointValue]];
            for (NSValue* point in pointArr) {
                CGPoint p = [point CGPointValue];
                [path1 addLineToPoint:p];
            }
            [path1 setLineWidth:self.eraserWidth];
            [path1 stroke];
            
        }
    }

    if (_pointCur.count > 1) {
        if (!self.penEraserChose.selectedSegmentIndex) {
            [self.fillColor setStroke];
        }
        else{
            [self.backgroundColor setStroke];
        }
        UIBezierPath* path = [[UIBezierPath alloc]init];
        [path moveToPoint:[_pointCur.firstObject CGPointValue]];
        for (NSValue* point in _pointCur) {
            CGPoint p = [point CGPointValue];
            [path addLineToPoint:p];
        }
        [path setLineWidth:_penEraserChose.selectedSegmentIndex ? self.eraserWidth:self.penWidth];
        [path stroke];
    }
    
}

@end
