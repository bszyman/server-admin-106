//
//  ServiceNavigationItem.m
//  Server Admin
//
//  Created by Ben Szymanski on 2/18/22.
//

#import "ServiceNavigationItem.h"

NSUInteger const ServiceOfflineStatus = 0;
NSUInteger const ServiceWaitingStatus = 1;
NSUInteger const ServiceOnlineStatus = 2;

@implementation ServiceNavigationItem

- (instancetype)initWithTitle:(NSString *)title
                   serverHost:(NSString *)serverHost
                 andServiceId:(NSString *)serviceId
{
    self = [super init];
    
    if (self) {
        self.title = title;
        self.serverHost = serverHost;
        self.serviceId = serviceId;
        self.serviceStatus = ServiceOfflineStatus;
    }
    
    return self;
}

@end
