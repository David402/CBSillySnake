//
//  CBFruit.h
//  CBSillySnake
//
//  Created by David Liu on 8/10/13.
//  Copyright (c) 2013 Cardinal Blue. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CBSnake.h"

@interface CBFruit : NSObject
@property (nonatomic, assign) CBSnakePoint point;

+ (id)fruitInWorldSize:(CGSize)worldSize;

@end
