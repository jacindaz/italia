class FakeS3Server
  require 'fakes3'
 
  def initialize(pid)
    @pid = pid
  end
 
  def self.up
    pid = spawn("bundle exec fakes3 --port 10001 --root #{Rails.root.join('fakes3')}")
    @@instance = FakeS3Server.new(pid)
    return @@instance
  end
 
  def self.down
    @@instance.down if defined? @@instance
  end
 
  def down
    if @pid
      Process.kill("SIGINT", @pid)
      Process.waitpid2(@pid)
      @pid = nil
    end
  end
 
end