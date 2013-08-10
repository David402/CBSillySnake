//
//  CBSnake.m
//  CBSillySnake
//
//  Created by David Liu on 8/10/13.
//  Copyright (c) 2013 Cardinal Blue. All rights reserved.
//

#import "CBSnake.h"

@interface CBSnake ()
{
    NSMutableArray *_points;
    CGSize _worldSize;
}

@end

@implementation CBSnake
@synthesize points = _points;

- (id)initWithWorldSize:(CGSize)size Length:(NSInteger)length
{
    self = [super init];
    if (self) {
        _worldSize = size;
        _points = [NSMutableArray array];
        for (NSInteger i = 0; i < length; i++) {
            CBSnakePoint p = CBMakeSnakePoint(0 + i, 1);
            [_points addObject:[NSValue valueWithSnakePoint:p]];
        }
    }
    return self;
}

CBSnakePoint CBMakeSnakePoint(NSInteger x, NSInteger y)
{
    CBSnakePoint point;
    point.x = x;
    point.y = y;
    return point;
}

- (void)setDirection:(CBSnakeDirection)direction
{
    switch (_direction) {
        case CBSnakeDirectionUp:
            if (direction != CBSnakeDirectionDown) {
                _direction = direction;
            }
            break;
        case CBSnakeDirectionDown:
            if (direction != CBSnakeDirectionUp) {
                _direction = direction;
            }
            break;
        case CBSnakeDirectionLeft:
            if (direction != CBSnakeDirectionRight) {
                _direction = direction;
            }
            break;
        case CBSnakeDirectionRight:
            if (direction != CBSnakeDirectionLeft) {
                _direction = direction;
            }
            
        default:
            break;
    }
}

- (void)move
{
    [_points removeLastObject];
    CBSnakePoint p = [_points[0] snakePointValue];
    switch (self.direction) {
        case CBSnakeDirectionUp:
            if (--p.y < 0) p.y = _worldSize.height - 1;
            break;
        case CBSnakeDirectionDown:
            if (++p.y >= _worldSize.height) p.y = 0;
            break;
        case CBSnakeDirectionLeft:
            if (--p.x < 0) p.x = _worldSize.width - 1;
            break;
        case CBSnakeDirectionRight:
            if (++p.x >= _worldSize.width) p.x = 0;
            break;
            
        default:
            break;
    }
    [_points insertObject:[NSValue valueWithSnakePoint:p] atIndex:0];
}

- (void)grow
{
    CBSnakePoint p = [_points[0] snakePointValue];
    switch (self.direction) {
        case CBSnakeDirectionUp:
            if (--p.y < 0) p.y = _worldSize.height - 1;
            break;
        case CBSnakeDirectionDown:
            if (++p.y >= _worldSize.height) p.y = 0;
            break;
        case CBSnakeDirectionLeft:
            if (--p.x < 0) p.x = _worldSize.width - 1;
            break;
        case CBSnakeDirectionRight:
            if (++p.x >= _worldSize.width) p.x = 0;
            break;
            
        default:
            break;
    }
    [_points insertObject:[NSValue valueWithSnakePoint:p] atIndex:0];
}

- (BOOL)isDead
{
    CBSnakePoint p = [_points[0] snakePointValue];
    for (int i = 1; i < _points.count; i++) {
        if (p.x == [_points[i] snakePointValue].x &&
            p.y == [_points[i] snakePointValue].y) {
            return YES;
        }
    }
    return NO;
}

@end

@implementation NSValue (SnakeView)

+ (id)valueWithSnakePoint:(CBSnakePoint)point
{
    return [NSValue valueWithBytes:&point objCType:@encode(CBSnakePoint)];
}

- (CBSnakePoint)snakePointValue
{
    if (strcasecmp([self objCType], @encode(CBSnakePoint)) == 0) {
        CBSnakePoint point;
        [self getValue:&point];
        return point;
    }
    return CBMakeSnakePoint(0, 0);
}

@end