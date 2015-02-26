#!/usr/bin/env ruby 

require 'digest/sha1'

class GitCoinMiner
  USERNAME = 'user-uqdczrkj'

  def initialize(*args)
    reset
    @counter = 0
    @timestamp = Time.now.to_i
    findGitCoin
  end
  
  def findGitCoin
    hashed = nil
    until hashed = Digest::SHA1.hexdigest("#{header}#{body}\n") and hashed < difficulty
      `git hash-object -t commit --stdin -w <<< "#{body}"`
      `git reset --hard "#{hashed}"`
      if system 'git push -ff origin master'
        return hashed
      end
      resetGit
      @counter += 1
      @timestamp = Time.now.to_i
    end
  end

  def difficulty
    @difficulty ||= File.read('difficulty.txt').gsub("\n","")
  end

  def header
    "commit #{body.length+1}\0"
  end

  def body
    "tree #{tree}\n" +
    "parent #{parent}\n" + 
    "author CTF user <lucas@foo.com> #{@timestamp} +0000\n" +
    "committer CTF user <lucas@foo.com> #{@timestamp} +0000\n" +
    "Give me a Gitcoin " +
    "#{@counter}\n"
  end

  def parent
    @parent ||= `git rev-parse HEAD`.gsub("\n","")
  end

  def tree
    @tree ||= `git write-tree`.gsub("\n","")
  end

  def reset
    @difficulty = @parent = @tree = nil
    `git fetch origin master`
    `git reset --hard origin/master`
    ledger = File.open('LEDGER.txt')
    unless ledger.read.include? USERNAME
      f = File.open('LEDGER.txt','a') << "#{USERNAME}: 1\n"
      f.close
    end
    ledger.close
    `git add LEDGER.txt`
  end

end

threads = []
threads << Thread.new { GitCoinMiner.new }
threads << Thread.new {
  while true
    local = `git describe --always --abbrev=16`.gsub("\n","")
    remote = `git ls-remote origin 'refs/heads/master'`.gsub("\n","")
    unless remote.include? local
      threads[0].kill
      threads[0] = Thread.new { GitCoinMiner.new }
    end
    sleep 10
  end
}
threads.each { |t| t.join }

