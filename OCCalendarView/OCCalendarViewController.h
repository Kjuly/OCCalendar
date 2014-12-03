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
  
  UIColor * todayColor_;
  
  OCSelectionMode selectionMode_;
  BOOL showViewAnimated_;
  BOOL withCalendarContainer_;
  
  id <OCCalendarDelegate> __weak delegate_;
}

@property (nonatomic, strong) OCCalendarView * calView;
@property (nonatomic, strong) NSDate * startDate;
@property (nonatomic, strong) NSDate * endDate;
@property (nonatomic, strong) UIColor * todayColor;
@property (nonatomic, assign) OCSelectionMode selectionMode;
@property (nonatomic, weak) id <OCCalendarDelegate> delegate;

- (id)initAtPoint:(CGPoint)point inView:(UIView *)view;
- (id)initAtPoint:(CGPoint)point inView:(UIView *)view arrowPosition:(OCArrowPosition)arrowPosition;
- (id)initAtPoint:(CGPoint)point inView:(UIView *)view arrowPosition:(OCArrowPosition)arrowPosition selectionMode:(OCSelectionMode)selectionMode;
- (id)initAtPoint:(CGPoint)point inView:(UIView *)view arrowPosition:(OCArrowPosition)arrowPosition selectionMode:(OCSelectionMode)selectionMode showViewAnimated:(BOOL)showViewAnimated;
- (id)initAtPoint:(CGPoint)point inView:(UIView *)view arrowPosition:(OCArrowPosition)arrowPosition selectionMode:(OCSelectionMode)selectionMode showViewAnimated:(BOOL)showViewAnimated withCalendarContainer:(BOOL)withCalendarContainer todayColor:(UIColor *)todayColor;

@end


@protocol OCCalendarDelegate <NSObject>

@required
-(void)completedWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;

@optional
-(void)completedWithNoSelection;

@end
