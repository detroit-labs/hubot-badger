# Description
#   Generates a poll.
#   Hubot will automatically end the poll when everyone has answered.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot poll <question> -a <answers> - Create a poll with comma separated answers
#   hubot (end|stop|close) poll - End current poll and show results
#   hubot vote <number> - Cast your vote
#   hubot previous poll - Previous poll results
#
# Notes:
#   $ hubot poll How cool is that? -a Amazeballz, Very Nice, Nice, Boring
#   $ hubot vote 1
#   $ hubot end vote
#   $ hubot previous poll
#
# Author:
#   EtienneLem

class Poll

  constructor: (@robot) ->
    @poll = null
    @previousPoll = null

    @robot.respond /poll (.*) -a (.*)/i, this.createPoll
    @robot.respond /(end|stop|close) poll/i, this.endPoll
    @robot.respond /vote ([0-9]*)/i, this.vote
    @robot.respond /previous poll/i, this.showPreviousPoll

  getUser: (msg) ->
    msg.message.user

  # Poll management
  createPoll: (msg) =>
    answers = this.createAnswers(msg.match[2])
    return msg.send('Please provide at least 2 answers') if answers.length <= 1

    user = this.getUser(msg)
    @poll = { user: user, question: msg.match[1], answers: answers, cancelled: 0, voters: {} }

    msg.send """#{user.name} asked: #{@poll.question}
    0. [Cancel my vote]
    #{this.printAnswers()}
    """

  endPoll: (msg) =>
    return msg.send('There’s currently no poll to end.') unless @poll

    msg.send """Here are the results for “#{@poll.question}”:
    #{this.printResults(@poll)}
    This poll was brought to you by #{@poll.user.name}
    """

    @previousPoll = @poll
    @poll = null

  showPreviousPoll: (msg) =>
    return msg.send('There’s currently no previous poll.') unless @previousPoll

    msg.send """Here are the results for “#{@previousPoll.question}”:
    #{this.printResults(@previousPoll)}
    This poll was brought to you by #{@previousPoll.user.name}
    """

  # Ansers management
  createAnswers: (answers) ->
    { text: answer, votes: 0 } for answer in answers.split(/\s?,\s?/)

  printAnswers: ->
    ("#{i+1}. #{answer.text}" for answer, i in @poll.answers).join("\n")

  printResults: (poll) ->
    poll.answers.sort (a, b) ->
      return 1 if (a.votes < b.votes)
      return -1 if (a.votes > b.votes)
      0

    results = ''
    results += ("#{answer.text} (#{answer.votes})" for answer in poll.answers).join("\n")
    results += "\n\nOut of #{Object.keys(poll.voters).length} total voters, #{poll.cancelled} canceled their vote."

  # Vote management
  vote: (msg) =>
    number = parseInt(msg.match[1])
    user = this.getUser(msg)

    # Errors
    return msg.send('Sorry, there’s no pending poll at the moment.') unless @poll
    return msg.send("There are only #{@poll.answers.length} answers.") if number > @poll.answers.length

    # User already voted
    if (userAnswer = @poll.voters[user.name]) != undefined
      sorry = "Sorry #{user.name}, but you’ve already "
      if userAnswer is 0
        sorry += 'cancelled your vote for this poll.'
      else
        sorry += "voted for “#{userAnswer}. #{@poll.answers[userAnswer - 1].text}” for this poll."

      return msg.send(sorry)

    # Save user vote
    @poll.voters[user.name] = number
    votersCount = Object.keys(@poll.voters).length

    # Cancel vote
    if number is 0
      @poll.cancelled++
      msg.send("#{user.name} decided not to vote.")

    # Cast vote
    else
      votedAnswer = @poll.answers[number - 1]
      votedAnswer.votes++
      msg.send "#{user.name} voted “#{votedAnswer.text}”"

    # Close poll if all users have voted
    # return if votersCount < @robot.brain.data.users.length - 1
    # msg.send "It looks like all users casted their vote. Automatically closing this poll."
    # this.endPoll(msg)

module.exports = (robot) ->
  new Poll(robot)
