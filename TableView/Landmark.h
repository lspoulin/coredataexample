//
//  Landmark.h
//  TableView
//
//  Created by Louis-Simon Poulin on 2018-03-20.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Landmark : NSObject
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *titre;
@property (strong, nonatomic) NSString *titreDescription;
@property (strong, nonatomic) NSString *details;
@property float latitude;
@property float longitude;

-(instancetype)initWithTitle:(NSString *) title anddescription:(NSString *) descriptions andimage:(NSString *) image anddetailDescription:(NSString *) detailDescription andLatitude:(float) latitude andLongitude:(float) longitude;
@end
