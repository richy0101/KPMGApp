//
//  RHPLocationVIewController.m
//  KPMG
//
//  Created by Richard Phillips on 12/8/14.
//  Copyright (c) 2014 Richard Phillips. All rights reserved.
//

#import "RHPLocationVIewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface RHPLocationViewController ()

@end

@implementation RHPLocationViewController


- (void)viewDidLoad {
    
    //add office locations to array
    self.arrayPickerView = [[NSMutableArray alloc] init];
    [self.arrayPickerView addObject:@"Beverly Hills"];
    [self.arrayPickerView addObject:@"Cypress"];
    [self.arrayPickerView addObject:@"Los Angeles"];
    [self.arrayPickerView addObject:@"Irvine"];
    [self.arrayPickerView addObject:@"Sacramento"];
    [self.arrayPickerView addObject:@"San Diego"];
    [self.arrayPickerView addObject:@"Santa Clara"];
    [self.arrayPickerView addObject:@"Walnut Creek"];
    [self.arrayPickerView addObject:@"Woodland Hills"];
    
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    //initialize camera and marker
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:34.067502
                                                            longitude:-118.391775
                                                                 zoom:10];
    self.mapView.camera = camera;
    self.mapView.myLocationEnabled = YES;
    
    self.marker = [[GMSMarker alloc] init];
    self.marker.icon = [GMSMarker markerImageWithColor:[UIColor blueColor]];
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.arrayPickerView.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // set the current city to the currently selected row
    self.currentCity = self.arrayPickerView[[self.pickerView selectedRowInComponent:0]];
    
    // have the marker appear at different office locations w/ info
    if([self.currentCity  isEqual: @"Beverly Hills"]){
        self.marker.position = CLLocationCoordinate2DMake(34.067502, -118.391775);
        self.marker.title = @"9171 Wilshire Boulevard  Beverly Hills, CA";
        self.marker.snippet = @"Tel: 310 273-2770";
        self.marker.map = self.mapView;
        self.mapView.selectedMarker = self.marker;
        self.mapView.camera = [GMSCameraPosition cameraWithLatitude:34.067502 longitude:-118.391775 zoom:11];
    }
    else if([self.currentCity  isEqual: @"Cypress"]){
        self.marker.position = CLLocationCoordinate2DMake(33.802417, -118.027501);
        self.marker.title = @"6032 Katella Avenue  Cypress, CA";
        self.marker.snippet = @"Tel: 714 934-5400";
        self.marker.map = self.mapView;
        self.mapView.selectedMarker = self.marker;
        self.mapView.camera = [GMSCameraPosition cameraWithLatitude:33.802417 longitude:-118.027501 zoom:11];
    }
    else if([self.currentCity  isEqual: @"Los Angeles"]){
        self.marker.position = CLLocationCoordinate2DMake(34.049940, -118.255677);
        self.marker.title = @"550 South Hope St.  Los Angeles, CA";
        self.marker.snippet = @"Tel: 213 972-4000";
        self.marker.map = self.mapView;
        self.mapView.selectedMarker = self.marker;
        self.mapView.camera = [GMSCameraPosition cameraWithLatitude:34.049940 longitude:-118.255677 zoom:11];
    }
    else if([self.currentCity  isEqual: @"Irvine"]){
        self.marker.position = CLLocationCoordinate2DMake(33.650892, -117.749659);
        self.marker.title = @"20 Pacifica  Irvine, CA ";
        self.marker.snippet = @"Tel: 949 885-5400";
        self.marker.map = self.mapView;
        self.mapView.selectedMarker = self.marker;
        self.mapView.camera = [GMSCameraPosition cameraWithLatitude:33.650892 longitude:-117.749659 zoom:11];
    }
    else if([self.currentCity  isEqual: @"Sacramento"]){
        self.marker.position = CLLocationCoordinate2DMake(38.578377, -121.501493);
        self.marker.title = @"500 Capitol Mall  Sacramento, CA";
        self.marker.snippet = @"Tel: 916 448-4700";
        self.marker.map = self.mapView;
        self.mapView.selectedMarker = self.marker;
        self.mapView.camera = [GMSCameraPosition cameraWithLatitude:38.578377 longitude:-121.501493 zoom:11];
    }
    else if([self.currentCity  isEqual: @"San Diego"]){
        self.marker.position = CLLocationCoordinate2DMake(32.875221, -117.203693);
        self.marker.title = @"4747 Executive Drive, San Diego, CA";
        self.marker.snippet = @"Tel: 858 750-7100";
        self.marker.map = self.mapView;
        self.mapView.selectedMarker = self.marker;
        self.mapView.camera = [GMSCameraPosition cameraWithLatitude:32.875221 longitude:-117.203693 zoom:11];
    }
    else if([self.currentCity  isEqual: @"Santa Clara"]){
        self.marker.position = CLLocationCoordinate2DMake(37.387404, -121.973954);
        self.marker.title = @"Mission Towers 1, Santa Clara, CA";
        self.marker.snippet = @"Tel: 408 367-5764";
        self.marker.map = self.mapView;
        self.mapView.selectedMarker = self.marker;
        self.mapView.camera = [GMSCameraPosition cameraWithLatitude:37.387404 longitude:-121.973954 zoom:11];
    }
    else if([self.currentCity  isEqual: @"Walnut Creek"]){
        self.marker.position = CLLocationCoordinate2DMake(37.909805, -122.066611);
        self.marker.title = @"2175 North California Boulevard  Walnut Creek, CA";
        self.marker.snippet = @"Tel: 925 946-1300";
        self.marker.map = self.mapView;
        self.mapView.selectedMarker = self.marker;
        self.mapView.camera = [GMSCameraPosition cameraWithLatitude:37.909805 longitude:-122.066611 zoom:11];
    }
    else if([self.currentCity  isEqual: @"Woodland Hills"]){
        self.marker.position = CLLocationCoordinate2DMake(34.179938, -118.601954);
        self.marker.title = @"21700 Oxnard Street  Woodland Hills, CA";
        self.marker.snippet = @"Tel: 818 227-6900";
        self.marker.map = self.mapView;
        self.mapView.selectedMarker = self.marker;
        self.mapView.camera = [GMSCameraPosition cameraWithLatitude:34.179938 longitude:-118.601954 zoom:11];
    }

    return self.arrayPickerView[row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
