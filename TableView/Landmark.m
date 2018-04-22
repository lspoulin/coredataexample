//
//  Landmark.m
//  TableView
//
//  Created by Louis-Simon Poulin on 2018-03-20.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

#import "Landmark.h"

@implementation Landmark
@synthesize image;
@synthesize titre;
@synthesize titreDescription;
@synthesize details;
@synthesize latitude;
@synthesize longitude;

-(instancetype) initWithTitle:(NSString *)title anddescription:(NSString *)descriptions andimage:(NSString *)image anddetailDescription:(NSString *)detailDescription andLatitude:(float)latitude andLongitude:(float)longitude{
    self = [super init];
    if(self) {
        [self setTitre:title];
        [self setTitreDescription:descriptions];
        [self setImage:image];
        [self setDetails:detailDescription];
        [self setLatitude:latitude];
        [self setLongitude:longitude];
    }
    return(self);
}
@end
