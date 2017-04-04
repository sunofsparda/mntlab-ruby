#!/usr/bin/env ruby

require 'open3'
cmd = 'ping google.com'
Open3.popen3(cmd) do | stdin, stdout, stderr, wait |
  status = wait.value
  unless status.success?
    abort 'ffdf'    
  end
end
