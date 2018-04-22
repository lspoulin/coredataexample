//
//  MapPin.h
//  TableView
//
//  Created by Louis-Simon Poulin on 2018-03-20.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapPin : NSObject <MKAnnotation>{
    CLLocationCoordinate2D coordinate;
}
@property(nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
