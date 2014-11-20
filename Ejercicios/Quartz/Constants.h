//
//  Constants.h
//  Quartz
//
//  Created by Developer Cymetria on 25/07/14.
//  Copyright (c) 2014 cymetria. All rights reserved.
//

#ifndef Quartz_Constants_h
#define Quartz_Constants_h

typedef enum {
    kLineShape = 0,
    kRectShape,
    kEllipseShape,
    kImageShape
} ShapeType;

typedef enum {
    kRedColorTab = 0,
    kBlueColorTab,
    kYellowColorTab,
    kRandomColorTab
} ColorTabIndex;

#define degressToRadian(x)(M_PI *(x) / 180.0)

#endif
