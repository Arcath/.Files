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
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

#Definitions
def test_string
	"The quick brown fox jumped over the lazy dog"
end
