//
//  ModuleGraphicalTabs.h
//  Server Admin
//
//  Created by Ben Szymanski on 2/18/22.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ModuleGraphicalTabs : NSView

@property (copy) NSString *notificationName;

- (void)addTabWithImageNamed:(NSString *)imageName
                       title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
