//
//  ViewController.h
//  CBSillySnake
//
//  Created by David Liu on 8/10/13.
//  Copyright (c) 2013 Cardinal Blue. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CBSnake.h"
#import "CBSnakeView.h"
#import "CBFruit.h"

@interface ViewController : UIViewController

@property (nonatomic, retain) CBSnake *snake;
@property (nonatomic, retain) CBSnakeView *snakeView;
@property (nonatomic, retain) CBFruit *fruit;

@end
