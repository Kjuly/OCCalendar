//
//  OCCalendarViewController.m
//  OCCalendar
//
//  Created by Oliver Rickard on 3/31/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "OCCalendarViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface OCCalendarViewController ()

@end


@implementation OCCalendarViewController

@synthesize calView   = calView_;
@synthesize startDate = startDate_,
            endDate   = endDate_;
@synthesize selectionMode = selectionMode_;
@synthesize delegate = delegate_;

- (void)dealloc {
  self.startDate = nil;
  self.endDate   = nil;
  self.delegate  = nil;
  [super dealloc];
}

- (id)initAtPoint:(CGPoint)point
           inView:(UIView *)view
    arrowPosition:(OCArrowPosition)arrowPosition
    selectionMode:(OCSelectionMode)selectionMode {
  self = [super initWithNibName:nil bundle:nil];
  if(self) {
    insertPoint_   = point;
    parentView_    = view;
    arrowPos_      = arrowPosition;
    selectionMode_ = selectionMode;
  }
  return self;
}

- (id)initAtPoint:(CGPoint)point inView:(UIView *)v arrowPosition:(OCArrowPosition)ap {
  return [self initAtPoint:point inView:v arrowPosition:ap selectionMode:OCSelectionDateRange];
}

- (id)initAtPoint:(CGPoint)point inView:(UIView *)v {
  return [self initAtPoint:point inView:v arrowPosition:OCArrowPositionCentered];
}

- (void)loadView {
  [super loadView];
  self.view.frame = parentView_.frame;
  
  
  //this view sits behind the calendar and receives touches.  It tells the calendar view to disappear when tapped.
  UIView *bgView = [[UIView alloc] initWithFrame:self.view.frame];
  bgView.backgroundColor = [UIColor clearColor];
  UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] init];
  tapG.delegate = self;
  [bgView addGestureRecognizer:[tapG autorelease]];
  [bgView setUserInteractionEnabled:YES];
  
  [self.view addSubview:[bgView autorelease]];
  
  int width = 390;
  int height = 300;
  
  float arrowPosX = 208;
  
  if(arrowPos_ == OCArrowPositionLeft) {
    arrowPosX = 67;
  } else if(arrowPos_ == OCArrowPositionRight) {
    arrowPosX = 346;
  }
  
  CGRect calViewFrame = CGRectMake(insertPoint_.x - arrowPosX, insertPoint_.y - 31.4, width, height);
  calView_ = [[OCCalendarView alloc] initAtPoint:insertPoint_
                                       withFrame:calViewFrame
                                   arrowPosition:arrowPos_];
  [calView_ setSelectionMode:selectionMode_];
  if(self.startDate) [calView_ setStartDate:startDate_];
  if(self.endDate)   [calView_ setEndDate:endDate_];
  
  [self.view addSubview:[calView_ autorelease]];
}

- (void)viewDidUnload {
  [super viewDidUnload];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
}

- (void)setStartDate:(NSDate *)sDate {
  if(startDate_) {
    [startDate_ release];
    startDate_ = nil;
  }
  startDate_ = [sDate retain];
  [calView_ setStartDate:startDate_];
}

- (void)setEndDate:(NSDate *)eDate {
  if(endDate_) {
    [endDate_ release];
    endDate_ = nil;
  }
  endDate_ = [eDate retain];
  [calView_ setEndDate:endDate_];
}

- (void)removeCalView {
  self.startDate = [calView_ getStartDate];
  self.endDate   = [calView_ getEndDate];
  
  //NSLog(@"startDate:%@ endDate:%@", startDate.description, endDate.description);
  
  //NSLog(@"CalView Selected:%d", [calView selected]);
  
  if([calView_ selected]) {
    if([startDate_ compare:endDate_] == NSOrderedAscending)
      [self.delegate completedWithStartDate:startDate_ endDate:endDate_];
    else
      [self.delegate completedWithStartDate:endDate_ endDate:startDate_];
  } else {
    if ([self.delegate respondsToSelector:@selector(completedWithNoSelection)]) {
      [self.delegate completedWithNoSelection];
    }
  }
  
  [calView_ removeFromSuperview];
  self.calView = nil;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
  if(self.calView) {
    //Animate out the calendar view if it already exists
    [UIView beginAnimations:@"animateOutCalendar" context:nil];
    [UIView setAnimationDuration:0.4f];
    calView_.transform = CGAffineTransformMakeScale(0.1, 0.1);
    calView_.alpha = 0.0f;
    [UIView commitAnimations];
    
    [self performSelector:@selector(removeCalView) withObject:nil afterDelay:0.4f];
  } else {
    //Recreate the calendar if it doesn't exist.
    
    //CGPoint insertPoint = CGPointMake(200+130*0.5, 200+10);
    CGPoint point = [touch locationInView:self.view];
    int width = 390;
    int height = 300;
    
    calView_ = [[OCCalendarView alloc] initAtPoint:point withFrame:CGRectMake(point.x - width*0.5, point.y - 31.4, width, height)];
    [self.view addSubview:[calView_ autorelease]];
  }
  
  return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

@end
