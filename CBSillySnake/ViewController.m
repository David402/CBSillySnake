//
//  ViewController.m
//  CBSillySnake
//
//  Created by David Liu on 8/10/13.
//  Copyright (c) 2013 Cardinal Blue. All rights reserved.
//

#import "ViewController.h"

#import "CBSnakeView.h"

@interface ViewController ()
    <CBSnakeViewDelegate,
    UIAlertViewDelegate
    >

@property (nonatomic, retain) NSTimer *refreshTimer;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.snakeView = [[CBSnakeView alloc] init];
    self.snakeView.frame = self.view.bounds;
    self.snakeView.delegate = self;
    [self.view addSubview:self.snakeView];

	// Do any additional setup after loading the view, typically from a nib.
    [self addSwipeGestureForDirection:UISwipeGestureRecognizerDirectionUp];
    [self addSwipeGestureForDirection:UISwipeGestureRecognizerDirectionDown];
    [self addSwipeGestureForDirection:UISwipeGestureRecognizerDirectionRight];
    [self addSwipeGestureForDirection:UISwipeGestureRecognizerDirectionLeft];
    [self startGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startGame
{
    CGSize worldSize = CGSizeMake(15, 24);
    self.snake = [[CBSnake alloc] initWithWorldSize:worldSize Length:2];
    self.fruit = [CBFruit fruitInWorldSize:worldSize];

    self.refreshTimer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                         target:self
                                                       selector:@selector(handleRefreshTimerFire:)userInfo:nil                                                        repeats:YES];
}

- (void)stopGame
{
    self.refreshTimer = nil;
}

- (void)setRefreshTimer:(NSTimer *)refreshTimer
{
    [_refreshTimer invalidate];
    _refreshTimer = refreshTimer;
}

- (void)addSwipeGestureForDirection:(UISwipeGestureRecognizerDirection)direction
{
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeGesture.direction = direction;
    [self.view addGestureRecognizer:swipeGesture];
}

- (CBSnake *)snakeForSnakeView:(CBSnakeView *)view
{
    return self.snake;
}

- (CBFruit *)fruitForSnakeView:(CBSnakeView *)view
{
    return self.fruit;
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe
{
    if (swipe.state == UIGestureRecognizerStateEnded) {
        NSLog(@"---------------------------------------------------direction: %i", swipe.direction);
        switch (swipe.direction) {
            case UISwipeGestureRecognizerDirectionUp:
                self.snake.direction = CBSnakeDirectionUp;
                break;
            case UISwipeGestureRecognizerDirectionDown:
                self.snake.direction = CBSnakeDirectionDown;
                break;
            case UISwipeGestureRecognizerDirectionLeft:
                self.snake.direction = CBSnakeDirectionLeft;
                break;
            case UISwipeGestureRecognizerDirectionRight:
                self.snake.direction = CBSnakeDirectionRight;
                break;
                
            default:
                break;
        }
    }
}

- (void)handleRefreshTimerFire:(NSTimer *)timer
{
    [self.snake move];
    
    // Check if we are dead
    if ([self.snake isDead]) {
        [self stopGame];
        // show re-start
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    // Check if snake gets fruit
    if ([self.snake.points[0] snakePointValue].x == self.fruit.point.x
        && [self.snake.points[0] snakePointValue].y == self.fruit.point.y) {
        [self.snake grow];
        // re-genereate fruit
        self.fruit = [CBFruit fruitInWorldSize:self.snake.worldSize];
    }
    
    [self.snakeView setNeedsDisplay];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self startGame];
}


@end
