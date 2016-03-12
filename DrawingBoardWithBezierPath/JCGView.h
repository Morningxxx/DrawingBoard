//
//  JCGView.h
//  15th-assignment-QZ2d
//
//  Created by Morning on 2016/02/23.
//  Copyright © 2016年 Morning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCGToolbar.h"

@protocol JCGViewDelegate <NSObject>

@required
-(void)undo;
-(void)redo;
-(void)saveAsImage;
-(void)clearBoard;

@end

@interface JCGView : UIView<JCGViewDelegate>

/*controller on parentView we should use*/
@property (weak,nonatomic) UISegmentedControl* penEraserChose;
@property (weak,nonatomic) UIButton* redoBtn;
@property (weak,nonatomic) JCGToolbar* toolBar;

@end
