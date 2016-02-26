//
//  ViewController.m
//  DrawingBoardWithBezierPath
//
//  Created by Morning on 2016/02/25.
//  Copyright © 2016年 Morning. All rights reserved.
//

#import "ViewController.h"
#import "JCGView.h"

@interface ViewController ()
@property (nonatomic,weak) JCGView* drawView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    JCGView* drawingView = [[JCGView alloc]initWithFrame:self.view.bounds];
    drawingView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:drawingView];
    self.drawView = drawingView;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
