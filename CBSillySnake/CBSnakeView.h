//
//  CBSnakeView.h
//  CBSillySnake
//
//  Created by David Liu on 8/10/13.
//  Copyright (c) 2013 Cardinal Blue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "CBSnake.h"
#import "CBFruit.h"

@class CBSnakeView;

@protocol CBSnakeViewDelegate <NSObject>
- (CBSnake *)snakeForSnakeView:(CBSnakeView *)view;
- (CBFruit *)fruitForSnakeView:(CBSnakeView *)view;
@end

@interface CBSnakeView : UIView
@property (nonatomic, assign) id<CBSnakeViewDelegate> delegate;
@end
