//
//  OCCalendarViewController.h
//  OCCalendar
//
//  Created by Oliver Rickard on 3/31/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCCalendarView.h"

@class OCCalendarView;

@protocol OCCalendarDelegate;

@interface OCCalendarViewController : UIViewController <
  UIGestureRecognizerDelegate
> {
  UILabel * toolTipLabel_;
  OCCalendarView * calView_;
  
  CGPoint insertPoint_;
  OCArrowPosition arrowPos_;
  
  UIView * parentView_;
  
  NSDate * startDate_;
  NSDate * endDate_;
  
  OCSelectionMode selectionMode_;
  
  id <OCCalendarDelegate> delegate_;
}

@property (nonatomic, retain) OCCalendarView *calView;
@property (nonatomic, retain) NSDate *startDate;
@property (nonatomic, retain) NSDate *endDate;
@property (nonatomic, assign) OCSelectionMode selectionMode;
@property (nonatomic, assign) id <OCCalendarDelegate> delegate;

- (id)initAtPoint:(CGPoint)point inView:(UIView *)view;
- (id)initAtPoint:(CGPoint)point inView:(UIView *)view arrowPosition:(OCArrowPosition)arrowPosition;
- (id)initAtPoint:(CGPoint)point inView:(UIView *)view arrowPosition:(OCArrowPosition)arrowPosition selectionMode:(OCSelectionMode)selectionMode;

@end


@protocol OCCalendarDelegate <NSObject>

@required
-(void)completedWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

@optional
-(void)completedWithNoSelection;

@end
