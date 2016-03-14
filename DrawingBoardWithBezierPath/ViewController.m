//
//  ViewController.m
//  DrawingBoardWithBezierPath
//
//  Created by Morning on 2016/02/25.
//  Copyright © 2016年 Morning. All rights reserved.
//

#import "ViewController.h"
#import "JCGView.h"
#import "JCGToolbar.h"

@interface ViewController ()
@property (nonatomic,weak) JCGView* drawView;
@property (weak,nonatomic) UISegmentedControl* penEraserChose;
@property (weak,nonatomic) UIButton* redoBtn;
@property (weak,nonatomic) JCGToolbar* toolBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createDrawingView];
    
    /*creat Clear Button*/
    [self createClearButton];
    
    /*creat Undo Button*/
    [self createUndoButton];
    
    /**creat Save Button*/
    [self creatSaveButton];
    
    /**creat Redo Button*/
    [self createRedoButton];
    
    /**create pen-or-eraser choser*/
    [self creatEraserChoser];
    
    /**create a tool-bar*/
    [self addToolBar];
    
    /*give drawView the contrl it need*/
    self.drawView.penEraserChose = self.penEraserChose;
    self.drawView.redoBtn = self.redoBtn;
    self.drawView.toolBar = self.toolBar;
    
    [self.toolBar setSelectedItem:self.toolBar.items[0]];
    
}

/**creat a view for drawing*/
-(void)createDrawingView{
    JCGView* drawingView = [[JCGView alloc]initWithFrame:self.view.bounds];
    drawingView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:drawingView];
    self.drawView = drawingView;
}

/**create a tool-bar to choose drawing instriment*/
-(void)addToolBar{
    JCGToolbar* toolBar = [[JCGToolbar alloc] init];
    [self.view addSubview:toolBar];
    self.toolBar = toolBar;
}

#pragma mark - create-control method;

/**creat Clear Button*/
-(void)createClearButton{
    UIButton* clearBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    clearBtn.frame = CGRectMake(0, 30, 60, 20);
    [clearBtn setTitle:@"Clear" forState:UIControlStateNormal];
    [clearBtn addTarget:self.drawView action:@selector(clearBoard) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearBtn];
}
    
/**creat Undo Button*/
-(void)createUndoButton{
    UIButton* undoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    undoBtn.frame = CGRectMake(60, 30, 50, 20);
    [undoBtn setTitle:@"Undo" forState:UIControlStateNormal];
    [undoBtn addTarget:self.drawView action:@selector(undo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:undoBtn];
}

/**creat Redo Button*/
-(void)createRedoButton{
    UIButton* redoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    redoBtn.frame = CGRectMake(self.view.bounds.size.width-50-50, 30, 50, 20);
    [redoBtn setTitle:@"Redo" forState:UIControlStateNormal];
    [redoBtn addTarget:self.drawView action:@selector(redo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redoBtn];
    self.redoBtn = redoBtn;
    self.redoBtn.enabled = NO;
}

/**create pen-or-eraser choser*/
-(void)creatEraserChoser{
    UISegmentedControl* panErazerChose = [[UISegmentedControl alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2-50, 30, 100, 20)];
    self.penEraserChose= panErazerChose;
    [panErazerChose insertSegmentWithTitle:@"pen" atIndex:0 animated:NO];
    [panErazerChose insertSegmentWithTitle:@"eraser" atIndex:1 animated:NO];
    panErazerChose.selectedSegmentIndex = 0;
    [self.view addSubview:panErazerChose];
}

/**creat Save Button*/
-(void)creatSaveButton{
    UIButton* saveBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    saveBtn.frame = CGRectMake(self.view.bounds.size.width-50, 30, 50, 20);
    [saveBtn setTitle:@"Save" forState:UIControlStateNormal];
    [saveBtn addTarget:self.drawView action:@selector(saveAsImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBtn];
}

@end
