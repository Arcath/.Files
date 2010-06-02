#Require lines
require 'irb/completion'	#Adds Tab Completion
require '~/.irb/history'
require 'irb/ext/save-history'

#Run Commands
Readline::History.start_session_log

#Config Values
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb/history"

#Definitions
def s	#Testing string
	@s = @s || "The quick brown fox jumped over the lazy dog"
	@s
end

def a	#Testing Array
	array=[]
	1.upto(10).map { |i| array.push(i) }
	@a = @a || array
	@a
end

def i	#Testing Integer
	rand(100)
end
