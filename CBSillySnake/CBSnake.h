//
//  CBSnake.h
//  CBSillySnake
//
//  Created by David Liu on 8/10/13.
//  Copyright (c) 2013 Cardinal Blue. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    NSInteger x;
    NSInteger y;
} CBSnakePoint;

typedef enum {
    CBSnakeDirectionUp,
    CBSnakeDirectionDown,
    CBSnakeDirectionRight,
    CBSnakeDirectionLeft
} CBSnakeDirection;

CBSnakePoint CBMakeSnakePoint(NSInteger x, NSInteger y);

@interface CBSnake : NSObject

@property (nonatomic, readonly) NSArray *points;
@property (nonatomic, assign) CBSnakeDirection direction;
@property (nonatomic, readonly) CGSize worldSize;

- (id)initWithWorldSize:(CGSize)size Length:(NSInteger)length;
- (void)move;
- (void)grow;
- (BOOL)isDead;

@end

@interface NSValue (Snake)
+ (id)valueWithSnakePoint:(CBSnakePoint)point;
- (CBSnakePoint)snakePointValue;
@end
