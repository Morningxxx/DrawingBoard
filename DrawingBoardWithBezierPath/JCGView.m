//
//  JCGView.m
//  15th-assignment-QZ2d
//
//  Created by Morning on 2016/02/23.
//  Copyright © 2016年 Morning. All rights reserved.
//

#import "JCGView.h"



@interface JCGView()

/*point array or dic for drawing*/
@property (nonatomic, strong) NSMutableArray<NSDictionary*>* pointAll;
@property (nonatomic, strong) NSMutableArray* pointCur;
@property (nonatomic, strong) NSMutableArray<NSDictionary*>* redoArr;

/*drawing property*/
@property (strong,nonatomic) UIColor* strokeColor;
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
        /*set defult drawing property*/
        self.strokeColor = [UIColor blackColor];
        self.penWidth = 3;
        self.eraserWidth = 10;
    }
    return self;
}

#pragma mark - Lazy Loading
/*lazy loading*/
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

-(NSMutableArray<NSDictionary *> *)redoArr{
    if (!_redoArr) {
        _redoArr = [NSMutableArray array];
    }
    return _redoArr;
}


#pragma mark - userAction
/*undo last drawing*/
-(void)undo{
    if ([self.pointAll lastObject]) {
        [self.redoArr addObject:[self.pointAll lastObject]];
    }
    [self.pointAll removeLastObject];
    [self setNeedsDisplay];
    self.redoBtn.enabled = self.redoArr.count;
}

/*redo last undo or clear*/
-(void)redo{
    if(_redoArr.count){
        if (!_pointAll) {
            self.pointAll = _redoArr;
            [self setNeedsDisplay];
            _redoArr = nil;

        }else{
            [self.pointAll addObject:[self.redoArr lastObject]];
            [self.redoArr removeLastObject];
            [self setNeedsDisplay];
        }
    }
    self.redoBtn.enabled = self.redoArr.count;
}

/*clear board*/
-(void)clearBoard{
    self.redoArr = self.pointAll;
    self.pointCur = nil;
    self.pointAll = nil;
    [self setNeedsDisplay];
    self.redoBtn.enabled = self.redoArr.count;
}


/*save image to album*/
-(void)saveAsImage{
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:ctx];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    UIGraphicsEndImageContext();
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
}


#pragma mark - Touch Events
/*touch events*/
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
    [self setNeedsDisplay];
    if (self.pointCur.count>2) {
        NSDictionary* path = @{_penEraserChose.selectedSegmentIndex ? @"eraser":@"pen" : self.pointCur};
        [self.pointAll addObject:path];
        self.redoArr = nil;
    }
    self.penEraserChose.userInteractionEnabled = YES;
    self.pointCur = nil;
    self.redoBtn.enabled = self.redoArr.count;
}


#pragma mark - Drawing
/*drawing method*/
-(void)drawRect:(CGRect)rect{
    if (_pointAll) {
        for (NSDictionary* pointDic in _pointAll) {
            
            [self drawPanActionWithPointArray:pointDic[@"pen"]];
            [self drawEraserActionWithPointArray:pointDic[@"eraser"]];
        }
    }

    if (_pointCur.count > 2) {
        if (!self.penEraserChose.selectedSegmentIndex) {
            [self drawPanActionWithPointArray:_pointCur];
        }
        else{
            [self drawEraserActionWithPointArray:_pointCur];
        }
    }
}

-(void)drawPanActionWithPointArray:(NSArray*)pointArr{
    [self.strokeColor setStroke];
    UIBezierPath* path = [[UIBezierPath alloc]init];
    [path moveToPoint:[pointArr.firstObject CGPointValue]];
    for (NSValue* point in pointArr) {
        CGPoint p = [point CGPointValue];
        [path addLineToPoint:p];
    }
    [path setLineWidth:self.penWidth];
    [path stroke];
}

-(void)drawEraserActionWithPointArray:(NSArray*)pointArr{
    [self.backgroundColor setStroke];
    UIBezierPath* path = [[UIBezierPath alloc]init];
    [path moveToPoint:[pointArr.firstObject CGPointValue]];
    for (NSValue* point in pointArr) {
        CGPoint p = [point CGPointValue];
        [path addLineToPoint:p];
    }
    [path setLineWidth:self.eraserWidth];
    [path stroke];
}

@end