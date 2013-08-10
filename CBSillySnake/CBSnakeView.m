//
//  CBSnakeView.m
//  CBSillySnake
//
//  Created by David Liu on 8/10/13.
//  Copyright (c) 2013 Cardinal Blue. All rights reserved.
//

#import "CBSnakeView.h"

@implementation CBSnakeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundColor = [UIColor whiteColor];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CBSnake *snake = [self.delegate snakeForSnakeView:self];
    NSArray *points = snake.points;
    CGFloat w = self.bounds.size.width / snake.worldSize.width;
    CGFloat h = self.bounds.size.height / snake.worldSize.height;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] set];
    for (NSValue *v in points) {
        CBSnakePoint p = [v snakePointValue];
        CGRect rect = CGRectMake(w * p.x, h * p.y, w, h);
        CGContextFillRect(context, rect);
    }
    
    // Fruit
    CBFruit *fruit = [self.delegate fruitForSnakeView:self];
    if (fruit) {
        [[UIColor yellowColor] set];
        CBSnakePoint p = fruit.point;
        CGRect rect = CGRectMake(w * p.x, h * p.y, w, h);
        CGContextFillEllipseInRect(context, rect);
    }
}

@end
