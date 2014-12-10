//
//  RHPDataModel.m
//  Fortunes
//
//  Created by Richard Phillips on 10/7/14.
//  Copyright (c) 2014 Richard Phillips. All rights reserved.
//

#import "RHPDataModel.h"

//NSString *const NewsArray = @"NewsArray";

// class extension
@interface RHPDataModel ()

// private properties
@property (strong,nonatomic) NSMutableArray *news;
@property (strong,nonatomic) NSMutableArray *dates;
@property (strong,nonatomic) NSMutableArray *urls;

@end

@implementation RHPDataModel

// implement all methods

- (id)init
{
    self = [super init];
    if (self) {
        
        _urls = [[NSMutableArray alloc] initWithObjects: nil];
        _dates = [[NSMutableArray alloc] initWithObjects: nil];
        _news = [[NSMutableArray alloc] initWithObjects: nil];
        [self fillNews];
        
    }
    return self;
}

- (void) fillNews{  //HTML Parser
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://www.kpmg.com/uk/en/issuesandinsights/articlespublications/newsreleases/pages/default.aspx"]]; //url of site to be scraped
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSScanner *scanner = [NSScanner scannerWithString:html];
    BOOL temp = FALSE;
    
    while (temp == FALSE){
        NSString *tempHeadline = nil;
        NSString *tempDate = nil;
        NSString *tempURL = nil;
        
        //find the unique html code BEFORE the news URL
        [scanner scanUpToString:@"padding-bottom:2px;\"" intoString:NULL];
        [scanner scanUpToString:@"href=\"" intoString:NULL];
        
        //find the unique news URL
        [scanner scanUpToString:@"\" target" intoString:&tempURL];
    
        //find the unique html code BEFORE the news headline
        [scanner scanUpToString:@"<script>WrapLongWords(" intoString:NULL];
        [scanner scanUpToString:@"\"" intoString:NULL];
    
        //find the unique news headline
        [scanner scanUpToString:@"\");</script>" intoString:&tempHeadline];
        
        //find the unique html code BEFORE the news date
        [scanner scanUpToString:@"normal;\"" intoString:NULL];
        [scanner scanUpToString:@">" intoString:NULL];
        
        //find the unique news date
        [scanner scanUpToString:@"<" intoString:&tempDate];
        
        if (tempHeadline == NULL) {
            [self insertNews:@"No More News!" atIndex:[self numberOfNews]];
            temp = TRUE;
        } //end if
        else {
            //replace &quot html code with an actual quote mark > "
            NSString *smartTopStory = [tempHeadline stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
            
            //delete quote mark before headline
            NSString *revisedTopStory = [smartTopStory stringByReplacingOccurrencesOfString:@"\"" withString:@""];
            
            //replace &#39 html code with an actual '
            NSString *topStoryString = [revisedTopStory stringByReplacingOccurrencesOfString:@"&#39;" withString:@"'"];
            
            //erase > from date string
            NSString *revisedDate = [tempDate stringByReplacingOccurrencesOfString:@">" withString:@""];
            
            //erase beginning quotes from URL string
            NSString *revisedURL = [tempURL stringByReplacingOccurrencesOfString:@"href=\"" withString:@""];
            
            //ADD news headline/date/URL to appropriate arrays
            [self insertURL:revisedURL atIndex:[self numberOfURLs]];
            [self insertNews:topStoryString atIndex:[self numberOfNews]];
            [self insertDate:revisedDate atIndex:[self numberOfDates]];
        }
    }
}


- (NSUInteger) numberOfNews{
    return [self.news count];
}

- (NSString *) newsAtIndex:(NSUInteger)index{
    return [self.news objectAtIndex:index];
}

- (void) insertNews: (NSString *) news atIndex: (NSUInteger) index{
    NSUInteger numOfNews = [self numberOfNews];
    if (index <= numOfNews){
        [self.news insertObject:news atIndex:index];
    }
}

- (NSUInteger) numberOfDates{
    return [self.dates count];
}

- (NSString *) dateAtIndex:(NSUInteger)index{
    return [self.dates objectAtIndex:index];
}

- (void) insertDate: (NSString *) date atIndex: (NSUInteger) index{
    NSUInteger numOfDates = [self numberOfDates];
    if (index <= numOfDates){
        [self.dates insertObject:date atIndex:index];
    }
}

- (NSUInteger) numberOfURLs{
    return [self.urls count];
}

- (NSString *) urlAtIndex:(NSUInteger)index{
    return [self.urls objectAtIndex:index];
}

- (void) insertURL: (NSString *) url atIndex: (NSUInteger) index{
    NSUInteger numOfURLs = [self numberOfURLs];
    if (index <= numOfURLs){
        [self.urls insertObject:url atIndex:index];
    }
}
    
+ (instancetype) sharedModel{
    static RHPDataModel *_sharedModel = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedModel = [[self alloc] init];
    });
    return _sharedModel;
}

@end
