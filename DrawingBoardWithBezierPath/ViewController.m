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

@property (weak,nonatomic) UISegmentedControl* penEraserChose;
@property (weak,nonatomic) UIButton* redoBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    JCGView* drawingView = [[JCGView alloc]initWithFrame:self.view.bounds];
    drawingView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:drawingView];
    self.drawView = drawingView;
    
    /*creat Clear Button*/
    UIButton* clearBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    clearBtn.frame = CGRectMake(0, 30, 60, 20);
    [clearBtn setTitle:@"Clear" forState:UIControlStateNormal];
    [clearBtn addTarget:self.drawView action:@selector(clearBoard) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearBtn];
    
    /*creat Undo Button*/
    UIButton* undoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    undoBtn.frame = CGRectMake(60, 30, 50, 20);
    [undoBtn setTitle:@"Undo" forState:UIControlStateNormal];
    [undoBtn addTarget:self.drawView action:@selector(undo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:undoBtn];
    
    /*creat Save Button*/
    UIButton* saveBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    saveBtn.frame = CGRectMake(self.view.bounds.size.width-50, 30, 50, 20);
    [saveBtn setTitle:@"Save" forState:UIControlStateNormal];
    [saveBtn addTarget:self.drawView action:@selector(saveAsImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBtn];
    
    /*creat Redo Button*/
    UIButton* redoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    redoBtn.frame = CGRectMake(self.view.bounds.size.width-50-50, 30, 50, 20);
    [redoBtn setTitle:@"Redo" forState:UIControlStateNormal];
    [redoBtn addTarget:self.drawView action:@selector(redo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redoBtn];
    self.redoBtn = redoBtn;
    self.redoBtn.enabled = NO;
    
    /*creat pen-or-eraser choser*/
    UISegmentedControl* panErazerChose = [[UISegmentedControl alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2-50, 30, 100, 20)];
    self.penEraserChose= panErazerChose;
    [panErazerChose insertSegmentWithTitle:@"pen" atIndex:0 animated:NO];
    [panErazerChose insertSegmentWithTitle:@"eraser" atIndex:1 animated:NO];
    panErazerChose.selectedSegmentIndex = 0;
    [self.view addSubview:panErazerChose];
    
    /*give drawView the contrl it need*/
    self.drawView.penEraserChose = self.penEraserChose;
    self.drawView.redoBtn = self.redoBtn;
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
