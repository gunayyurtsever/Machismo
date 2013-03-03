//
//  CardGameResult.h
//  Machismo
//
//  Created by Gunay Yurtsever on 03/03/13.
//  Copyright (c) 2013 Gunay Yurtsever. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardGameResult : NSObject

@property (readonly, nonatomic) NSDate* start;
@property (readonly, nonatomic) NSDate* end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;
@end
