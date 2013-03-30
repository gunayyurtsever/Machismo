//
//  CardGameResult.m
//  Machismo
//
//  Created by Gunay Yurtsever on 03/03/13.
//  Copyright (c) 2013 Gunay Yurtsever. All rights reserved.
//

#import "CardGameResult.h"

@interface CardGameResult()

@property (readwrite, nonatomic) NSDate* start;
@property (readwrite, nonatomic) NSDate* end;
@property (readwrite, nonatomic) NSTimeInterval duration;


@end


@implementation CardGameResult

- (id)init
{
    self = [super init];
    if (self) {
        _start = [NSDate date];
        _end = _start;
    }
    return self;
}

- (NSTimeInterval)duration
{
    return [self.end timeIntervalSinceDate:self.start];
}

- (void)setScore:(int)score
{
    _score = score;
    _end = [NSDate date];
    [self synchronize];
}


#define ALL_RESULTS_KEY @"Matchismo_Regular_GameResults_All"
   
- (void)synchronize{
    NSMutableDictionary *mutableGameResultsFromUserDefaults = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
    if (!mutableGameResultsFromUserDefaults) mutableGameResultsFromUserDefaults = [[NSMutableDictionary alloc] init];
    mutableGameResultsFromUserDefaults[[self.start description]] = [self asPropertyList];
    [[NSUserDefaults standardUserDefaults] setObject:mutableGameResultsFromUserDefaults forKey:ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSArray *)allGameResults{
    NSMutableArray *allGameResults = [[NSMutableArray alloc] init];
    for (id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] allValues]) {
        CardGameResult *result = [[CardGameResult alloc] initFromPropertyList:plist];
        [allGameResults addObject:result];
    }
    return  allGameResults;
}

#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"

// convenience initializer
- (id)initFromPropertyList:(id)plist {
    self = [self init];
    if (self) {
        if ([plist isKindOfClass:[NSDictionary class]]){
            _start = plist[START_KEY];
            _end = plist[END_KEY];
            _score = (int)plist[SCORE_KEY];
            if (!_start || !_end) self = nil;
        }
    }
    return self;
}


- (id)asPropertyList{
    return @{START_KEY : self.start, END_KEY : self.end, SCORE_KEY : @(self.score) };
}

    
@end
