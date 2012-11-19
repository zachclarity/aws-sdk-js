# Copyright 2011-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

AWS = require('../../lib/core')

configure = (options) -> new AWS.Config(options)

describe 'AWS.Config', ->

  describe 'constructor', ->
    it 'should be able to pass in a Config object as parameter', ->
      config = new AWS.Config(sslEnabled: false, maxRetries: 0)
      copyConfig = new AWS.Config(config)
      expect(copyConfig).not.toBe(config)
      expect(copyConfig.sslEnabled).toEqual(false)
      expect(copyConfig.maxRetries).toEqual(0)

  describe 'region', ->
    it 'defaults to undefined', ->
      expect(configure().region).toEqual(undefined)
    it 'can be set to a string', ->
      expect(configure(region: 'us-west-1').region).toEqual('us-west-1')

  describe 'maxRetries', ->
    it 'defaults to unefined', ->
      expect(configure().maxRetries).toEqual(undefined)
    it 'can be set to an integer', ->
      expect(configure(maxRetries: 2).maxRetries).toEqual(2)

  describe 'sslEnabled', ->
    it 'defaults to true', ->
      expect(configure().sslEnabled).toEqual(true)
    it 'can be set to false', ->
      expect(configure(sslEnabled: false).sslEnabled).toEqual(false)

  describe 'default', ->
    it 'should have a default Config object', ->
      expect(AWS.config.sslEnabled).toEqual(true)
      expect(AWS.config.maxRetries).toEqual(undefined)

    it 'can set default config to an object literal', ->
      AWS.config = {}
      expect(AWS.config).toEqual({})

