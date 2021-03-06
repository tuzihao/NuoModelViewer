//
//  NuoMeshRotation.m
//  ModelViewer
//
//  Created by middleware on 2/2/17.
//  Copyright © 2017 middleware. All rights reserved.
//

#import "NuoMeshRotation.h"
#import "NuoMathUtilities.h"



@implementation NuoMeshRotation
{
    matrix_float4x4 _rotationMatrix;
    matrix_float3x3 _rotationNormalMatrix;
}


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _x = 0;
        _y = 0;
        _z = 0;
        _xAxis = 0;
        _yAxis = 0;
        _zAxis = 1;
        _radius = 0;
    }
    
    [self generateMatrices];
    
    return self;
}



- (instancetype)initWith:(NuoMeshRotation*)rotation
{
    self = [super init];
    
    if (self)
    {
        _x = rotation.x;
        _y = rotation.y;
        _z = rotation.z;
        _xAxis = rotation.xAxis;
        _yAxis = rotation.yAxis;
        _zAxis = rotation.zAxis;
        _radius = rotation.radius;
    }
    
    [self generateMatrices];
    
    return self;
}


- (void)generateMatrices
{
    vector_float3 transformVector = { _x, _y, _z };
    vector_float3 rotationVector = { _xAxis, _yAxis, _zAxis };
    
    matrix_float4x4 transMatrix = matrix_float4x4_translation(transformVector);
    matrix_float4x4 transMatrixInv = matrix_float4x4_translation(-transformVector);
    matrix_float4x4 rotationMatrix = matrix_float4x4_rotation(vector_normalize(rotationVector), _radius);
    
    _rotationMatrix = matrix_multiply(transMatrixInv, matrix_multiply(rotationMatrix, transMatrix));
    _rotationNormalMatrix = matrix_float4x4_extract_linear(_rotationMatrix);
}



- (void)setRadius:(float)radius
{
    _radius = radius;
    [self generateMatrices];
}



- (matrix_float4x4)rotationMatrix
{
    return _rotationMatrix;
}


- (matrix_float3x3)rotationNormalMatrix
{
    return _rotationNormalMatrix;
}


@end
