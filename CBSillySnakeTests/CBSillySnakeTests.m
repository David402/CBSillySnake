//
//  CBSillySnakeTests.m
//  CBSillySnakeTests
//
//  Created by David Liu on 8/10/13.
//  Copyright (c) 2013 Cardinal Blue. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "CBSnake.h"

@interface CBSillySnakeTests : XCTestCase
@property (nonatomic, retain) CBSnake *snake;
@end

@implementation CBSillySnakeTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.snake = [[CBSnake alloc] initWithWorldSize:CGSizeMake(15,24) Length:2];
    
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSnakeDirection
{
    // Default direction to Left
    self.snake.direction = CBSnakeDirectionLeft;
    
    // Change left to right
    self.snake.direction = CBSnakeDirectionRight;
    XCTAssertEqual(self.snake.direction, CBSnakeDirectionLeft, @"must be left still");

    // Change left to up
    self.snake.direction = CBSnakeDirectionUp;
    XCTAssertEqual(self.snake.direction, CBSnakeDirectionUp, @"must be up");

    // Change up to down
    self.snake.direction = CBSnakeDirectionDown;
    XCTAssertEqual(self.snake.direction, CBSnakeDirectionUp, @"must be up still");

    // Change down to right
    self.snake.direction = CBSnakeDirectionRight;
    XCTAssertEqual(self.snake.direction, CBSnakeDirectionRight, @"must be right");

    // Change right to down
    self.snake.direction = CBSnakeDirectionDown;
    XCTAssertEqual(self.snake.direction, CBSnakeDirectionDown, @"must be down");
}

- (void)testSnakeGrow
{
    XCTAssertEqual([self.snake.points count], (NSUInteger)2, @"must be 2 by default");
    
    [self.snake grow];
    XCTAssertEqual([self.snake.points count], (NSUInteger)3, @"must be 3");
}

@end
