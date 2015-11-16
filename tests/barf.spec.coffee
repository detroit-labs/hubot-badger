Helper = require 'hubot-test-helper'
chai = require 'chai'
expect = chai.should()
chai.use require 'chai-things'
helper = new Helper './../scripts/barf.coffee'

describe 'barf', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  context 'user says barf', ->
    it 'should post Jason Stolaruk\'s barf tweet', ->
      @room.user.say 'macklin', '@hubot barf'
      @room.messages.should.include.something.that.deep.equals [
        'hubot', 'https://twitter.com/JasonStolaruk/status/468797103129366528'
      ]
