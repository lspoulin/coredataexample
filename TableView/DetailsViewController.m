//
//  DetailsViewController.m
//  TableView
//
//  Created by Louis-Simon Poulin on 2018-03-20.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

#import "DetailsViewController.h"
#import <MapKit/MapKit.h>
#import "MapPin.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

@synthesize landmark;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [[self navigationItem] setTitle:[[self landmark] titre]];
    [[self detailTitleLabel] setText:[[self landmark]titre]];
    [[self detailDescriptionLabel] setText:[[self landmark]titreDescription]];
    [[self detailImageView] setImage:[UIImage imageNamed:[[self landmark]image]]];
    [[self detailDescriptionDetailsLabel] setText:[[self landmark]details]];
   
    [[[self detailMapView] layer] setCornerRadius:5];
    [[[self detailDirectionButton] layer] setCornerRadius:5];
    // Do any additional setup after loading the view.
    
    float latitude = [[self landmark]latitude] ;
    float longitude = [[self landmark]longitude];
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    
    CLLocationCoordinate2D location;
    
    location.latitude = latitude;
    location.longitude = longitude;
    
    region.span = span;
    region.center = location;
    
    [[self detailMapView] setRegion:region animated:YES];
    
    MapPin *ann = [[MapPin alloc] init];
    ann.coordinate = location;
    
    [[self detailMapView] addAnnotation:ann];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)directions:(id)sender{
    float latitude = [[self landmark]latitude] ;
    float longitude = [[self landmark]longitude];
    NSString *url =  [NSString stringWithFormat:@"http://maps.apple.com/maps?daddr=%f,%f", latitude, longitude];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];
    
}

@end
