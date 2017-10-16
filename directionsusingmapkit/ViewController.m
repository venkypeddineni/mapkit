//
//  ViewController.m
//  directionsusingmapkit
//
//  Created by apple on 10/10/17.
//  Copyright © 2017 Nadboy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)getBtn:(id)sender {
    NSString *fromString =[NSString stringWithFormat:@"%@",_fromTxt.text];
    NSString *toString =[NSString stringWithFormat:@"%@",_toTxt.text];
    
    CLGeocoder*geocoder=[[CLGeocoder alloc]init];
[geocoder geocodeAddressString:fromString completionHandler:^(NSArray *placemarks, NSError *  error)
     {
        
        CLPlacemark *geocoderFromPlacemark= [placemarks objectAtIndex:0];
         MKPlacemark *fromPlacemark =[[MKPlacemark alloc]initWithCoordinate:geocoderFromPlacemark.location.coordinate addressDictionary:geocoderFromPlacemark.addressDictionary];
         MKMapItem*fromMapItem = [[MKMapItem alloc]initWithPlacemark:fromPlacemark];
         [fromMapItem setName:geocoderFromPlacemark.name];
         
         [geocoder geocodeAddressString:toString completionHandler:^(NSArray *placemarks, NSError *  error)
          {
              
              CLPlacemark *geocoderToPlacemark= [placemarks objectAtIndex:0];
              MKPlacemark *toPlacemark =[[MKPlacemark alloc]initWithCoordinate:geocoderToPlacemark.location.coordinate addressDictionary:geocoderToPlacemark.addressDictionary];
              MKMapItem*toMapItem = [[MKMapItem alloc]initWithPlacemark:toPlacemark];
              [toMapItem setName:geocoderToPlacemark.name];
              NSDictionary *launchOptions=@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving};
              [MKMapItem openMapsWithItems:@[fromMapItem,toMapItem] launchOptions:launchOptions];
    }];
     }];
}
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
    {
        MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
        renderer.strokeColor = [UIColor colorWithRed:0.0/255.0 green:171.0/255.0 blue:253.0/255.0 alpha:1.0];
        renderer.lineWidth = 10.0;
        return  renderer;
    }


@end
