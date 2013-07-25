//
//  TikrTimeUntil.m
//  Tikr
//
//  Created by Marc Chambers on 7/24/13.
//  Copyright (c) 2013 Tikr. All rights reserved.
//

#import "TikrTimeUntil.h"

@implementation TikrTimeUntil

+(NSString*)timeUntil:(NSDate *)until
{
    NSDate* today=[NSDate date];
    
    NSDateComponents* components=[[NSCalendar currentCalendar] components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:today toDate:until options:0];
    
    NSString* eventTimeUntil;
    
    NSString* comp1;
    NSString* comp2;
    NSString* comp3;
    
    if(components.year>0)
    {
        if(components.year==1)
            comp1=@"year";
        else
            comp1=@"years";
        
        if(components.month==1)
            comp2=@"month";
        else
            comp2=@"months";
        
        if(components.day==1)
            comp3=@"day";
        else
            comp3=@"days";
        
        eventTimeUntil=[NSString stringWithFormat:@"in %u %@, %u %@, %u %@",
                        components.year, comp1, components.month, comp2, components.day, comp3];
    }
    else if(components.month>0)
    {
        if(components.month==1)
            comp1=@"month";
        else
            comp1=@"months";
        
        if(components.day==1)
            comp2=@"day";
        else
            comp2=@"days";
        
        if(components.hour==1)
            comp3=@"hour";
        else
            comp3=@"hours";
        
        eventTimeUntil=[NSString stringWithFormat:@"in %u %@, %u %@, %u %@",
                        components.month, comp1, components.day, comp2, components.hour, comp3];
    }
    else if(components.day>0)
    {
        if(components.day==1)
            comp1=@"day";
        else
            comp1=@"days";
        
        if(components.hour==1)
            comp2=@"hour";
        else
            comp2=@"hours";
        
        if(components.minute==1)
            comp3=@"minute";
        else
            comp3=@"minutes";
        
        eventTimeUntil=[NSString stringWithFormat:@"in %u %@, %u %@ and %u %@",
                        components.day, comp1, components.hour, comp2, components.minute, comp3];
    }
    else if(components.hour>0)
    {
        if(components.hour==1)
            comp1=@"hour";
        else
            comp1=@"hours";
        
        if(components.minute==1)
            comp2=@"minute";
        else
            comp2=@"minutes";
        
        if(components.second==1)
            comp3=@"second";
        else
            comp3=@"seconds";
        
        eventTimeUntil=[NSString stringWithFormat:@"in %u %@, %u %@ and %u %@",
                        components.hour, comp1, components.minute, comp2, components.second, comp3];
    }
    else if(components.minute>0)
    {
        if(components.minute==1)
            comp1=@"minute";
        else
            comp1=@"minutes";
        
        if(components.second==1)
            comp2=@"second";
        else
            comp2=@"seconds";
        
        eventTimeUntil=[NSString stringWithFormat:@"in %u %@ and %u %@",
                        components.minute, comp1, components.second, comp2];
    }
    else if(components.second>0)
    {
        if(components.second==1)
            comp1=@"second";
        else
            comp1=@"seconds";
        
        eventTimeUntil=[NSString stringWithFormat:@"in %u %@",
                        components.second, comp1];
    }
    
    return eventTimeUntil;
}

@end
