//
//  QuartzView.h
//  Quartz
//
//  Created by Developer Cymetria on 25/07/14.
//  Copyright (c) 2014 cymetria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"
#import "UIColor+Random.h"

@interface QuartzView : UIView

@property CGPoint fistTouch;
@property CGPoint lastTouch;

@property UIColor * currentColor;
@property ShapeType shapeType;

@property UIImage * drawImage;
@property BOOL useRandomColor;

@property (nonatomic) CGRect currentRect;
@property CGRect redrawRect;

@end
