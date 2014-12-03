//
//  OCDaysView.h
//  OCCalendar
//
//  Created by Oliver Rickard on 3/30/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCDaysView : UIView {
    long startCellX;
    long startCellY;
    long endCellX;
    long endCellY;
    
    float xOffset;
    float yOffset;
    
    float hDiff;
    float vDiff;
    
    long currentMonth;
    long currentYear;
    
    BOOL didAddExtraRow;
}

@property (nonatomic, retain) UIColor * todayColor;

- (void)setMonth:(long)month;
- (void)setYear:(long)year;

- (void)resetRows;

- (BOOL)addExtraRow;

@end
