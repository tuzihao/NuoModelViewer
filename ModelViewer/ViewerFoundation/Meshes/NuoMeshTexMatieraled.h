//
//  NuoMeshTexMatieraled.h
//  ModelViewer
//
//  Created by dfeng on 9/7/16.
//  Copyright © 2016 middleware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NuoMeshTextured.h"




@interface NuoMeshTexMatieraled : NuoMeshTextured


- (instancetype)initWithDevice:(id<MTLDevice>)device
            withVerticesBuffer:(void*)buffer withLength:(size_t)length
                   withIndices:(void*)indices withLength:(size_t)indicesLength;

- (MTLRenderPipelineDescriptor*)makePipelineStateDescriptor;

- (void)makeTextureOpacity:(NSString*)texPath withCommandQueue:(id<MTLCommandQueue>)queue;
- (void)makeTextureBump:(NSString*)texPath withCommandQueue:(id<MTLCommandQueue>)queue;
- (void)setIgnoreTexutreAlpha:(BOOL)ignoreAlpha;


@end


@interface NuoMeshMatieraled : NuoMesh


- (instancetype)initWithDevice:(id<MTLDevice>)device
            withVerticesBuffer:(void*)buffer withLength:(size_t)length
                   withIndices:(void*)indices withLength:(size_t)indicesLength;


@end


