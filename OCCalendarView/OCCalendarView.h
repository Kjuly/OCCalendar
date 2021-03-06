//
//  OCCalendarView.h
//  OCCalendar
//
//  Created by Oliver Rickard on 3/30/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCTypes.h"
typedef enum {
  OCArrowPositionLeft = -1,
  OCArrowPositionCentered = 0,
  OCArrowPositionRight = 1,
  OCArrowPositionNone = 99
} OCArrowPosition;


@class OCSelectionView;
@class OCDaysView;

@interface OCCalendarView : UIView {
    NSCalendar *calendar;
    
    long currentMonth;
    long currentYear;
    
    long startCellX;
    long startCellY;
    long endCellX;
    long endCellY;
    
    float hDiff;
    float vDiff;
    
    OCSelectionView *selectionView;
    OCDaysView *daysView;
    
    int arrowPosition;
}

- (id)initAtPoint:(CGPoint)p withFrame:(CGRect)frame;
- (id)initAtPoint:(CGPoint)p withFrame:(CGRect)frame arrowPosition:(OCArrowPosition)arrowPos;
- (id)initAtPoint:(CGPoint)p withFrame:(CGRect)frame arrowPosition:(OCArrowPosition)arrowPos showAnimated:(BOOL)showAnimated;
- (id)initAtPoint:(CGPoint)p withFrame:(CGRect)frame arrowPosition:(OCArrowPosition)arrowPos showAnimated:(BOOL)showAnimated withCalendarContainer:(BOOL)withCalendarContainer todayColor:(UIColor *)todayColor;

//Valid Positions: OCArrowPositionLeft, OCArrowPositionCentered, OCArrowPositionRight
- (void)setArrowPosition:(OCArrowPosition)pos;

- (NSDate *)getStartDate;
- (NSDate *)getEndDate;

- (BOOL)selected;

- (void)setStartDate:(NSDate *)sDate;
- (void)setEndDate:(NSDate *)eDate;

@property OCSelectionMode selectionMode;
@end
