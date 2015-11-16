Helper = require 'hubot-test-helper'
sinon = require 'sinon'
chai = require 'chai'
expect = chai.should()
chai.use require 'chai-things'
chai.use require 'sinon-chai'
helper = new Helper './../scripts/gbnf.coffee'

describe 'gbnf', =>

  before =>
    @formerLabber = 'http://image.url/formerlabber.jpg'
    @john = 'http://image.url/john.jpg'

  beforeEach =>
    @room = helper.createRoom()
    sinon.stub @room.robot.brain, 'get'
    sinon.spy @room.robot.brain, 'set'
    @room.robot.brain.get.withArgs('gbnf_images').returns([@formerLabber])
    @reply = ['hubot', @formerLabber]

  afterEach =>
    @room.robot.brain.get.restore()
    @room.robot.brain.set.restore()
    @room.destroy()

  describe 'displaying a fallen comrade', ->

    context "when hubot hears 'gone but'", ->
      it 'should not reply', ->
        say 'gone but'
        doesNotContainReply()

    context "when hubot hears 'gone but|and'", ->
      it 'should not reply', ->
        say 'gone but|and'
        doesNotContainReply()

    context "when hubot hears 'gone but not forgotten'", ->
      it 'should reply with an image URL', ->
        say 'gone but not forgotten'
        containsReply()

    context "when hubot hears 'gone but not forgotten'", ->
      it 'should reply with an image URL', ->
        say 'gone but not forgotten'
        containsReply()

  describe 'adding a fallen comrade', =>

    context "when user tells hubot 'dont forget http://image.url/john.jpg'", =>
      it 'should add John to the not-forgotten list', =>
        say "@hubot dont forget #{@john}"
        addsComrade()

    context "when user tells hubot 'don't forget http://image.url/john.jpg'", =>
      it 'should not add John to the not-forgotten list', =>
        say "@hubot don't forget #{@john}"
        doesNotAddComrade()

say = (message) =>
  @room.user.say 'user', message

containsReply = =>
  @room.messages.should.contain.something.that.deep.equals @reply

doesNotContainReply = =>
  @room.messages.should.not.contain.something.that.deep.equals @reply

addsComrade = =>
  key = 'gbnf_images'
  comrades = [@formerLabber, @john]
  @room.robot.brain.set.should.have.been.calledWith(key, comrades)

doesNotAddComrade = =>
  @room.robot.brain.set.should.not.have.been.calledOnce
