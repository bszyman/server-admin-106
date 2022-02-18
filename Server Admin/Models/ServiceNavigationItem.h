//
//  ServiceNavigationItem.h
//  Server Admin
//
//  Created by Ben Szymanski on 2/18/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSUInteger const ServiceOfflineStatus;
extern NSUInteger const ServiceWaitingStatus;
extern NSUInteger const ServiceOnlineStatus;

@interface ServiceNavigationItem : NSObject

@property (copy) NSString *title;
@property (copy) NSString *serverHost;
@property (copy) NSString *serviceId;
@property (assign) NSUInteger serviceStatus;

- (instancetype)initWithTitle:(NSString *)title
                   serverHost:(NSString *)serverHost
                 andServiceId:(NSString *)serviceId;

@end

NS_ASSUME_NONNULL_END
