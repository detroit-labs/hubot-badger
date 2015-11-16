Helper = require 'hubot-test-helper'
sinon = require 'sinon'
chai = require 'chai'
expect = chai.should()
chai.use require 'chai-things'
chai.use require 'sinon-chai'
helper = new Helper './../scripts/memrem.coffee'

describe 'memrem', ->

  beforeEach ->
    @room = helper.createRoom()
    sinon.stub @room.robot.brain, 'get'
    sinon.spy @room.robot.brain, 'set'

  afterEach ->
    @room.robot.brain.get.restore()
    @room.robot.brain.set.restore()
    @room.destroy()

  describe 'rem', ->

    it 'should set a value for key', ->
      @room.user.say 'user', '@hubot rem key value'
      @room.robot.brain.set.should.have.been.calledWith 'memrem_key', 'value'

    it 'should allow set as an alias', ->
      @room.user.say 'user', '@hubot set dog image'
      @room.robot.brain.set.should.have.been.calledWith 'memrem_dog', 'image'

    it 'should ignore safesearch as a keyword', ->
      @room.user.say 'user', '@hubot set safesearch value'
      @room.robot.brain.set.should.not.have.been.calledOnce

    it 'should notify the user of a successful key save', ->
      @room.user.say 'user', '@hubot rem drake http://i.imgur.com/PKaMRP0.jpg'
      @room.messages.should.contain.something.that.deep.equals [
        'hubot', 'saved http://i.imgur.com/PKaMRP0.jpg as drake'
      ]

  describe 'mem', ->

    it 'should return a value for key', ->
      @room.robot.brain.get.withArgs('memrem_key').returns('value')
      @room.user.say 'user', '@hubot mem key'
      @room.robot.brain.get.should.have.been.calledWith 'memrem_key'

    it 'should allow get as an alias', ->
      @room.robot.brain.get.withArgs('memrem_cat').returns('cat.gif')
      @room.user.say 'user', '@hubot get cat'
      @room.robot.brain.get.should.have.been.calledWith 'memrem_cat'

    it 'should ignore safesearch as a keyword', ->
      @room.user.say 'user', '@hubot get safesearch'
      @room.robot.brain.get.should.not.have.been.calledOnce

    it 'should notify the user of a successful retrieval', ->
      @room.robot.brain.get.withArgs('memrem_redPanda').returns('(heart)')
      @room.user.say 'user', '@hubot mem redPanda'
      @room.messages.should.contain.something.that.deep.equals [
        'hubot', '(heart)'
      ]

    it 'should notify the user of a failed retrieval', ->
      @room.robot.brain.get.withArgs('memrem_klaw').returns(null)
      @room.user.say 'user', '@hubot mem klaw'
      @room.messages.should.contain.something.that.deep.equals [
        'hubot', 'we does not has klaw'
      ]
