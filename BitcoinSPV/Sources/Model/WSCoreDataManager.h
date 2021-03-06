//
//  WSCoreDataManager.h
//  BitcoinSPV
//
//  Created by Davide De Rosa on 12/07/14.
//  Copyright (c) 2014 Davide De Rosa. All rights reserved.
//
//  https://github.com/keeshux
//
//  This file is part of BitcoinSPV.
//
//  BitcoinSPV is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  BitcoinSPV is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with BitcoinSPV.  If not, see <http://www.gnu.org/licenses/>.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface WSCoreDataManager : NSObject

- (instancetype)initWithPath:(NSString *)path error:(NSError **)error;
- (NSURL *)storeURL;
- (NSManagedObjectContext *)context;
- (void)truncate;
- (BOOL)truncateWithError:(NSError **)error;
- (BOOL)saveWithError:(NSError **)error;

@end

#pragma mark -

@interface NSManagedObject (CoreData)

- (instancetype)initWithContext:(NSManagedObjectContext *)context;
+ (NSString *)entityName;

@end
