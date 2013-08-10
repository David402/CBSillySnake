//
//  CBFruit.m
//  CBSillySnake
//
//  Created by David Liu on 8/10/13.
//  Copyright (c) 2013 Cardinal Blue. All rights reserved.
//

#import "CBFruit.h"

@implementation CBFruit

+ (id)fruitInWorldSize:(CGSize)worldSize
{
    CBFruit *fruit = [[CBFruit alloc] init];
    CBSnakePoint point = CBMakeSnakePoint(0, 0);
    point.x = random() % (NSInteger)worldSize.width;
    point.y = random() % (NSInteger)worldSize.height;
    fruit.point = point;
    return fruit;
}

@end
