//
//  QuartzView.m
//  Quartz
//
//  Created by Developer Cymetria on 25/07/14.
//  Copyright (c) 2014 cymetria. All rights reserved.
//

#import "QuartzView.h"


@implementation QuartzView

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        _currentColor =  [UIColor redColor];
        _useRandomColor = NO;
        _drawImage = [UIImage imageNamed:@"logo.png"];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(contex, 2.0f);
    CGContextSetStrokeColorWithColor(contex, _currentColor.CGColor);
    CGContextSetFillColorWithColor(contex, _currentColor.CGColor);
    
    switch (_shapeType) {
        case kLineShape:
            CGContextMoveToPoint(contex, _fistTouch.x, _fistTouch.y);
            CGContextAddLineToPoint(contex, _lastTouch.x, _lastTouch.y);
            CGContextStrokePath(contex);
            break;
        case kRectShape:
            CGContextAddRect(contex, self.currentRect);
            CGContextDrawPath(contex, kCGPathFillStroke);
            break;
        case kEllipseShape:
            CGContextAddEllipseInRect(contex, self.currentRect);
            CGContextDrawPath(contex, kCGPathFillStroke);
            break;
        case kImageShape:{
            CGFloat horizontalOffset = _drawImage.size.width/2;
            CGFloat verticalOffset = _drawImage.size.height/2;
            CGPoint drawPoint = CGPointMake(_lastTouch.x - horizontalOffset, _lastTouch.y-verticalOffset);
            
            [_drawImage drawAtPoint:drawPoint];
            break;
            }
            
            

            
            
            
        default:
            break;
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (_useRandomColor) {
        _currentColor = [UIColor randomColor];
    }
    UITouch * touch = [touches anyObject];
    _fistTouch = [touch locationInView:self];
    _lastTouch = [touch locationInView:self];
    
    
    
    [self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    _redrawRect = CGRectUnion(_redrawRect, self.currentRect);
   
    [self setNeedsDisplayInRect:_redrawRect];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    _lastTouch = [touch locationInView:self];
    _redrawRect = CGRectUnion(_redrawRect, self.currentRect);
   
    [self setNeedsDisplayInRect:_redrawRect];
}
-(CGRect)currentRect{
    return CGRectMake(_fistTouch.x, _fistTouch.y, _lastTouch.x-_fistTouch.x, _lastTouch.y-_fistTouch.y);
}

@end
